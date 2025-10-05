package pe.edu.upeu.bges.servicio.impl;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import pe.edu.upeu.bges.dtos.PersonaDto;
import pe.edu.upeu.bges.excepciones.ModelNotFoundException;
import pe.edu.upeu.bges.modelo.Persona;
import pe.edu.upeu.bges.modelo.Usuario;
import pe.edu.upeu.bges.repositorio.CatalogoProgramaRepository;
import pe.edu.upeu.bges.repositorio.PersonaRepository;
import pe.edu.upeu.bges.repositorio.UsuarioRepository;
import pe.edu.upeu.bges.servicio.IPersonaService;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class PersonaServiceImpl implements IPersonaService {

    @Autowired
    private PersonaRepository personaRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private CatalogoProgramaRepository catalogoRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    @Transactional
    public Persona crearPersona(PersonaDto.CrearPersonaDto crearDto, Long creadoPor) {
        // Validar que al menos un correo esté presente
        if ((crearDto.correoPersonal() == null || crearDto.correoPersonal().isEmpty()) &&
                (crearDto.correoInstitucional() == null || crearDto.correoInstitucional().isEmpty())) {
            throw new ModelNotFoundException("Debe proporcionar al menos un correo (personal o institucional)");
        }

        // Validar duplicados
        if (personaRepository.existsByCodigoEstudiante(crearDto.codigoEstudiante())) {
            throw new ModelNotFoundException("Ya existe una persona con el código: " + crearDto.codigoEstudiante());
        }

        if (personaRepository.existsByDocumentoIdentidad(crearDto.documentoIdentidad())) {
            throw new ModelNotFoundException("Ya existe una persona con el DNI: " + crearDto.documentoIdentidad());
        }

        // Validar correos duplicados
        if (crearDto.correoPersonal() != null && personaRepository.existsByCorreoPersonal(crearDto.correoPersonal())) {
            throw new ModelNotFoundException("El correo personal ya está registrado: " + crearDto.correoPersonal());
        }

        if (crearDto.correoInstitucional() != null &&
                personaRepository.existsByCorreoInstitucional(crearDto.correoInstitucional())) {
            throw new ModelNotFoundException("El correo institucional ya está registrado: " + crearDto.correoInstitucional());
        }

        // Crear usuario
        Usuario usuario = new Usuario();
        usuario.setUsuario(crearDto.usuarioLogin());
        usuario.setCorreo(crearDto.correoInstitucional() != null ?
                crearDto.correoInstitucional() : crearDto.correoPersonal());
        usuario.setContraseña(passwordEncoder.encode(crearDto.codigoEstudiante())); // Contraseña = código
        usuario.setRol(Usuario.Rol.INTEGRANTE);
        usuario = usuarioRepository.save(usuario);

        // Crear persona
        Persona persona = new Persona();
        persona.setUsuarioId(usuario.getIdUsuario());
        persona.setCodigoEstudiante(crearDto.codigoEstudiante());
        persona.setNombres(crearDto.nombres());
        persona.setApellidos(crearDto.apellidos());
        persona.setDocumentoIdentidad(crearDto.documentoIdentidad());
        persona.setCorreoPersonal(crearDto.correoPersonal());
        persona.setCorreoInstitucional(crearDto.correoInstitucional());
        persona.setUsuarioLogin(crearDto.usuarioLogin());
        persona.setCelular(crearDto.celular());
        persona.setPais(crearDto.pais());
        persona.setFotoUrl(crearDto.fotoUrl());
        persona.setReligion(crearDto.religion());
        persona.setFechaNacimiento(crearDto.fechaNacimiento());
        persona.setFechaMatricula(crearDto.fechaMatricula());
        persona.setModoContrato(crearDto.modoContrato());
        persona.setModalidadEstudio(crearDto.modalidadEstudio());
        persona.setSede(crearDto.sede());
        persona.setFacultad(crearDto.facultad());
        persona.setProgramaEstudio(crearDto.programaEstudio());
        persona.setCiclo(crearDto.ciclo());
        persona.setGrupo(crearDto.grupo());
        persona.setCreadoPor(creadoPor);

        return personaRepository.save(persona);
    }

    @Override
    @Transactional
    public PersonaDto.ResultadoImportacionDto importarDesdeExcel(MultipartFile file, Long creadoPor) {
        List<PersonaDto.ErrorImportacionDto> errores = new ArrayList<>();
        int exitosos = 0;
        int fila = 2; // Empezar desde fila 2 (después del header)

        try (Workbook workbook = new XSSFWorkbook(file.getInputStream())) {
            Sheet sheet = workbook.getSheetAt(0);

            for (Row row : sheet) {
                if (row.getRowNum() == 0) continue; // Saltar header

                try {
                    PersonaDto.ImportarPersonaDto importDto = extraerDatosDeRow(row);

                    // Validaciones
                    if (personaRepository.existsByCodigoEstudiante(importDto.codigoEstudiante())) {
                        errores.add(new PersonaDto.ErrorImportacionDto(
                                fila, importDto.codigoEstudiante(),
                                "Código duplicado"
                        ));
                        fila++;
                        continue;
                    }

                    if (importDto.correoPersonal() != null &&
                            personaRepository.existsByCorreoPersonal(importDto.correoPersonal())) {
                        errores.add(new PersonaDto.ErrorImportacionDto(
                                fila, importDto.codigoEstudiante(),
                                "Correo personal duplicado: " + importDto.correoPersonal()
                        ));
                        fila++;
                        continue;
                    }

                    if (importDto.correoInstitucional() != null &&
                            personaRepository.existsByCorreoInstitucional(importDto.correoInstitucional())) {
                        errores.add(new PersonaDto.ErrorImportacionDto(
                                fila, importDto.codigoEstudiante(),
                                "Correo institucional duplicado: " + importDto.correoInstitucional()
                        ));
                        fila++;
                        continue;
                    }

                    // Crear registro
                    crearPersonaDesdeImportacion(importDto, creadoPor);
                    exitosos++;

                } catch (Exception e) {
                    errores.add(new PersonaDto.ErrorImportacionDto(
                            fila, "N/A",
                            "Error al procesar: " + e.getMessage()
                    ));
                }

                fila++;
            }

        } catch (IOException e) {
            throw new ModelNotFoundException("Error al leer el archivo Excel: " + e.getMessage());
        }

        return new PersonaDto.ResultadoImportacionDto(
                fila - 2, exitosos, errores.size(), errores
        );
    }

    private PersonaDto.ImportarPersonaDto extraerDatosDeRow(Row row) {
        return new PersonaDto.ImportarPersonaDto(
                getCellValue(row, 0),  // Código estudiante
                getCellValue(row, 1),  // Estudiante
                getCellValue(row, 2),  // Documento
                getCellValue(row, 3),  // Correo personal
                getCellValue(row, 4),  // Correo institucional
                getCellValue(row, 5),  // Usuario
                getCellValue(row, 6),  // Celular
                getCellValue(row, 7),  // País
                getCellValue(row, 8),  // Foto
                getCellValue(row, 9),  // Religión
                getCellDate(row, 10),  // Fecha nacimiento
                getCellDateTime(row, 11), // Fecha matrícula
                getCellValue(row, 12), // Modo contrato
                getCellValue(row, 13), // Modalidad estudio
                getCellValue(row, 14), // Sede
                getCellValue(row, 15), // Facultad
                getCellValue(row, 16), // Programa
                getCellInteger(row, 17), // Ciclo
                getCellInteger(row, 18)  // Grupo
        );
    }

    private String getCellValue(Row row, int cellIndex) {
        Cell cell = row.getCell(cellIndex);
        if (cell == null) return null;

        return switch (cell.getCellType()) {
            case STRING -> cell.getStringCellValue();
            case NUMERIC -> String.valueOf((long) cell.getNumericCellValue());
            default -> null;
        };
    }

    private LocalDate getCellDate(Row row, int cellIndex) {
        Cell cell = row.getCell(cellIndex);
        if (cell == null || cell.getCellType() != CellType.NUMERIC) return null;

        try {
            return cell.getDateCellValue().toInstant()
                    .atZone(ZoneId.systemDefault()).toLocalDate();
        } catch (Exception e) {
            return null;
        }
    }

    private LocalDateTime getCellDateTime(Row row, int cellIndex) {
        Cell cell = row.getCell(cellIndex);
        if (cell == null || cell.getCellType() != CellType.NUMERIC) return null;

        try {
            return cell.getDateCellValue().toInstant()
                    .atZone(ZoneId.systemDefault()).toLocalDateTime();
        } catch (Exception e) {
            return null;
        }
    }

    private Integer getCellInteger(Row row, int cellIndex) {
        Cell cell = row.getCell(cellIndex);
        if (cell == null) return null;

        try {
            return (int) cell.getNumericCellValue();
        } catch (Exception e) {
            return null;
        }
    }

    @Transactional
    private void crearPersonaDesdeImportacion(PersonaDto.ImportarPersonaDto importDto, Long creadoPor) {
        // Separar nombres y apellidos
        String[] partesNombre = importDto.separarNombresApellidos();

        // Crear usuario
        Usuario usuario = new Usuario();
        usuario.setUsuario(importDto.usuarioLogin());
        usuario.setCorreo(importDto.correoInstitucional() != null ?
                importDto.correoInstitucional() : importDto.correoPersonal());
        usuario.setContraseña(passwordEncoder.encode(importDto.codigoEstudiante()));
        usuario.setRol(Usuario.Rol.INTEGRANTE);
        usuario = usuarioRepository.save(usuario);

        // Crear persona
        Persona persona = new Persona();
        persona.setUsuarioId(usuario.getIdUsuario());
        persona.setCodigoEstudiante(importDto.codigoEstudiante());
        persona.setApellidos(partesNombre[0]);
        persona.setNombres(partesNombre[1]);
        persona.setDocumentoIdentidad(importDto.documentoIdentidad());
        persona.setCorreoPersonal(importDto.correoPersonal());
        persona.setCorreoInstitucional(importDto.correoInstitucional());
        persona.setUsuarioLogin(importDto.usuarioLogin());
        persona.setCelular(importDto.celular());
        persona.setPais(importDto.pais());
        persona.setFotoUrl(importDto.fotoUrl());
        persona.setReligion(importDto.religion());
        persona.setFechaNacimiento(importDto.fechaNacimiento());
        persona.setFechaMatricula(importDto.fechaMatricula());

        // Convertir strings a enums
        if (importDto.modoContrato() != null) {
            persona.setModoContrato(Persona.ModoContrato.valueOf(importDto.modoContrato().toUpperCase()));
        }
        if (importDto.modalidadEstudio() != null) {
            persona.setModalidadEstudio(Persona.ModalidadEstudio.valueOf(importDto.modalidadEstudio().toUpperCase()));
        }

        persona.setSede(importDto.sede());
        persona.setFacultad(importDto.facultad());
        persona.setProgramaEstudio(importDto.programaEstudio());
        persona.setCiclo(importDto.ciclo());
        persona.setGrupo(importDto.grupo());
        persona.setCreadoPor(creadoPor);

        personaRepository.save(persona);
    }

    @Override
    public byte[] exportarAExcel(List<Long> idsPersonas) {
        List<Persona> personas = idsPersonas == null || idsPersonas.isEmpty() ?
                personaRepository.findAll() :
                personaRepository.findAllById(idsPersonas);

        try (Workbook workbook = new XSSFWorkbook(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            Sheet sheet = workbook.createSheet("Personas");

            // Header
            Row headerRow = sheet.createRow(0);
            String[] headers = {
                    "Código Estudiante", "Estudiante", "Documento", "Correo Personal",
                    "Correo Institucional", "Usuario", "Celular", "País", "Foto",
                    "Religión", "Fecha Nacimiento", "Fecha Matrícula", "Modo Contrato",
                    "Modalidad Estudio", "Sede", "Facultad", "Programa", "Ciclo", "Grupo"
            };

            for (int i = 0; i < headers.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(headers[i]);
            }

            // Datos
            int rowNum = 1;
            for (Persona p : personas) {
                Row row = sheet.createRow(rowNum++);
                row.createCell(0).setCellValue(p.getCodigoEstudiante());
                row.createCell(1).setCellValue(p.getApellidos() + " " + p.getNombres());
                row.createCell(2).setCellValue(p.getDocumentoIdentidad());
                row.createCell(3).setCellValue(p.getCorreoPersonal());
                row.createCell(4).setCellValue(p.getCorreoInstitucional());
                row.createCell(5).setCellValue(p.getUsuarioLogin());
                row.createCell(6).setCellValue(p.getCelular());
                row.createCell(7).setCellValue(p.getPais());
                row.createCell(8).setCellValue(p.getFotoUrl());
                row.createCell(9).setCellValue(p.getReligion());
                row.createCell(10).setCellValue(p.getFechaNacimiento() != null ? p.getFechaNacimiento().toString() : "");
                row.createCell(11).setCellValue(p.getFechaMatricula() != null ? p.getFechaMatricula().toString() : "");
                row.createCell(12).setCellValue(p.getModoContrato() != null ? p.getModoContrato().name() : "");
                row.createCell(13).setCellValue(p.getModalidadEstudio() != null ? p.getModalidadEstudio().name() : "");
                row.createCell(14).setCellValue(p.getSede());
                row.createCell(15).setCellValue(p.getFacultad());
                row.createCell(16).setCellValue(p.getProgramaEstudio());
                row.createCell(17).setCellValue(p.getCiclo() != null ? p.getCiclo() : 0);
                row.createCell(18).setCellValue(p.getGrupo() != null ? p.getGrupo() : 0);
            }

            workbook.write(out);
            return out.toByteArray();

        } catch (IOException e) {
            throw new ModelNotFoundException("Error al generar Excel: " + e.getMessage());
        }
    }

    @Override
    public List<PersonaDto.PersonaListadoDto> listarPersonas() {
        return personaRepository.findAll().stream()
                .map(this::convertirAListadoDto)
                .collect(Collectors.toList());
    }

    private PersonaDto.PersonaListadoDto convertirAListadoDto(Persona p) {
        Usuario usuario = p.getUsuarioId() != null ?
                usuarioRepository.findById(p.getUsuarioId()).orElse(null) : null;

        return new PersonaDto.PersonaListadoDto(
                p.getIdPersona(),
                p.getCodigoEstudiante(),
                p.getApellidos() + " " + p.getNombres(),
                p.getDocumentoIdentidad(),
                p.getCorreoPersonal(),
                p.getCorreoInstitucional(),
                p.getUsuarioLogin(),
                p.getSede(),
                p.getFacultad(),
                p.getProgramaEstudio(),
                p.getCiclo(),
                p.getGrupo(),
                usuario != null ? usuario.getRol().name() : "N/A"
        );
    }

    // Implementar métodos restantes...
    @Override
    public Persona actualizarPersona(Long idPersona, PersonaDto.CrearPersonaDto actualizarDto, Long modificadoPor) {
        Persona persona = personaRepository.findById(idPersona)
                .orElseThrow(() -> new ModelNotFoundException("Persona no encontrada"));

        // Actualizar campos
        persona.setNombres(actualizarDto.nombres());
        persona.setApellidos(actualizarDto.apellidos());
        // ... actualizar todos los campos necesarios
        persona.setModificadoPor(modificadoPor);

        return personaRepository.save(persona);
    }

    @Override
    public void eliminarPersona(Long idPersona) {
        personaRepository.deleteById(idPersona);
    }

    @Override
    public Persona obtenerPersona(Long idPersona) {
        return personaRepository.findById(idPersona)
                .orElseThrow(() -> new ModelNotFoundException("Persona no encontrada"));
    }

    @Override
    public List<PersonaDto.PersonaListadoDto> buscarPorSede(String sede) {
        return personaRepository.findBySede(sede).stream()
                .map(this::convertirAListadoDto)
                .collect(Collectors.toList());
    }

    @Override
    public List<PersonaDto.PersonaListadoDto> buscarPorFacultad(String facultad) {
        return personaRepository.findByFacultad(facultad).stream()
                .map(this::convertirAListadoDto)
                .collect(Collectors.toList());
    }

    @Override
    public List<PersonaDto.PersonaListadoDto> buscarPorPrograma(String programa) {
        return personaRepository.findByProgramaEstudio(programa).stream()
                .map(this::convertirAListadoDto)
                .collect(Collectors.toList());
    }

    @Override
    public List<String> obtenerSedes() {
        return catalogoRepository.findAllSedesActivas();
    }

    @Override
    public List<String> obtenerFacultadesPorSede(String sede) {
        return catalogoRepository.findFacultadesBySede(sede);
    }

    @Override
    public List<String> obtenerProgramasPorSedeYFacultad(String sede, String facultad) {
        return catalogoRepository.findProgramasBySedeAndFacultad(sede, facultad);
    }

    @Override
    public PersonaDto.CatalogoFiltroDto obtenerCatalogoCompleto(String sede) {
        List<String> facultades = catalogoRepository.findFacultadesBySede(sede);

        List<PersonaDto.FacultadDto> facultadDtos = facultades.stream()
                .map(facultad -> {
                    List<String> programas = catalogoRepository.findProgramasBySedeAndFacultad(sede, facultad);
                    return new PersonaDto.FacultadDto(facultad, programas);
                })
                .collect(Collectors.toList());

        return new PersonaDto.CatalogoFiltroDto(sede, facultadDtos);
    }
}
