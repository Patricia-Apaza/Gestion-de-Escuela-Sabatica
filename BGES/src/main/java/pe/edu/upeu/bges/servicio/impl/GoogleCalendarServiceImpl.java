package pe.edu.upeu.bges.servicio.impl;

import com.google.api.client.util.DateTime;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pe.edu.upeu.bges.dtos.CalendarioDto;
import pe.edu.upeu.bges.excepciones.ModelNotFoundException;
import pe.edu.upeu.bges.modelo.EventoAsistente;
import pe.edu.upeu.bges.modelo.EventoCalendario;
import pe.edu.upeu.bges.repositorio.EventoAsistenteRepository;
import pe.edu.upeu.bges.repositorio.EventoCalendarioRepository;
import pe.edu.upeu.bges.security.JwtTokenUtil;
import pe.edu.upeu.bges.servicio.IGoogleCalendarService;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import java.net.URLEncoder;

@Service
public class GoogleCalendarServiceImpl implements IGoogleCalendarService {

    @Autowired
    private Calendar googleCalendar;

    @Autowired
    private EventoCalendarioRepository eventoRepository;

    @Autowired
    private EventoAsistenteRepository asistenteRepository;

    private static final String CALENDAR_ID = "primary";

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Override
    @Transactional
    public CalendarioDto.EventoDto crearEvento(CalendarioDto.CrearEventoDto eventoDto) {
        try {
            // Obtener el ID del usuario autenticado desde el contexto de seguridad
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            Long usuarioIdAutenticado = null;

            if (authentication != null && authentication.getDetails() != null) {
                usuarioIdAutenticado = (Long) authentication.getDetails();
            }

            // Si no se puede obtener del contexto, usar valor por defecto
            if (usuarioIdAutenticado == null) {
                usuarioIdAutenticado = 1L; // Fallback
            }

            // 1. Crear evento en la base de datos local
            EventoCalendario eventoLocal = new EventoCalendario();
            eventoLocal.setTitulo(eventoDto.titulo());
            eventoLocal.setDescripcion(eventoDto.descripcion());
            eventoLocal.setFechaInicio(eventoDto.fechaInicio());
            eventoLocal.setFechaFin(eventoDto.fechaFin());
            eventoLocal.setUbicacion(eventoDto.ubicacion());
            eventoLocal.setTipoEvento(EventoCalendario.TipoEvento.OTRO);
            eventoLocal.setCreadoPor(usuarioIdAutenticado); // USAR ID DEL TOKEN

            eventoLocal = eventoRepository.save(eventoLocal);

            // 2. Crear evento en Google Calendar (SIN asistentes)
            Event googleEvent = new Event()
                    .setSummary(eventoDto.titulo())
                    .setLocation(eventoDto.ubicacion());

            // Agregar asistentes en la descripción
            StringBuilder descripcionCompleta = new StringBuilder(eventoDto.descripcion() != null ? eventoDto.descripcion() : "");
            if (eventoDto.asistentes() != null && !eventoDto.asistentes().isEmpty()) {
                descripcionCompleta.append("\n\n📋 Asistentes invitados:\n");
                for (String email : eventoDto.asistentes()) {
                    descripcionCompleta.append("• ").append(email).append("\n");
                }
            }
            googleEvent.setDescription(descripcionCompleta.toString());

            EventDateTime inicio = new EventDateTime()
                    .setDateTime(convertirADateTime(eventoDto.fechaInicio()))
                    .setTimeZone("America/Lima");
            googleEvent.setStart(inicio);

            EventDateTime fin = new EventDateTime()
                    .setDateTime(convertirADateTime(eventoDto.fechaFin()))
                    .setTimeZone("America/Lima");
            googleEvent.setEnd(fin);

            // Recordatorios
            if (eventoDto.recordatorio() != null && eventoDto.recordatorio()) {
                EventReminder[] reminderOverrides = new EventReminder[]{
                        new EventReminder().setMethod("popup")
                                .setMinutes(eventoDto.minutosAntes() != null ? eventoDto.minutosAntes() : 30)
                };
                Event.Reminders reminders = new Event.Reminders()
                        .setUseDefault(false)
                        .setOverrides(List.of(reminderOverrides));
                googleEvent.setReminders(reminders);
            }

            // Crear en Google Calendar SIN enviar invitaciones
            googleEvent = googleCalendar.events().insert(CALENDAR_ID, googleEvent).execute();

            // 3. Actualizar evento local con ID de Google
            eventoLocal.setGoogleEventId(googleEvent.getId());
            eventoLocal.setSincronizadoGoogle(true);
            eventoLocal.setFechaSincronizacion(LocalDateTime.now());
            eventoRepository.save(eventoLocal);

            // 4. Guardar asistentes en base de datos local
            if (eventoDto.asistentes() != null && !eventoDto.asistentes().isEmpty()) {
                for (String email : eventoDto.asistentes()) {
                    EventoAsistente asistente = new EventoAsistente();
                    asistente.setEventoId(eventoLocal.getIdEventoLocal());
                    asistente.setEmail(email);
                    asistente.setEstadoConfirmacion(EventoAsistente.EstadoConfirmacion.PENDIENTE);
                    // Aquí podrías buscar el usuario por email y asignar usuario_id
                    asistenteRepository.save(asistente);
                }
            }

            return convertirAEventoDto(eventoLocal, googleEvent);

        } catch (IOException e) {
            throw new ModelNotFoundException("Error al crear evento: " + e.getMessage());
        }
    }

    @Override
    public List<CalendarioDto.EventoDto> listarEventos(CalendarioDto.ListarEventosDto filtros) {
        List<EventoCalendario> eventos = eventoRepository.findEventosPorRangoFecha(
                filtros.fechaInicio(),
                filtros.fechaFin() != null ? filtros.fechaFin() : LocalDateTime.now().plusMonths(6)
        );

        return eventos.stream()
                .map(evento -> convertirAEventoDtoLocal(evento))
                .collect(Collectors.toList());
    }

    @Override
    public CalendarioDto.EventoDto obtenerEvento(String idEvento) {
        EventoCalendario evento = eventoRepository.findById(Long.parseLong(idEvento))
                .orElseThrow(() -> new ModelNotFoundException("Evento no encontrado"));
        return convertirAEventoDtoLocal(evento);
    }

    @Override
    @Transactional
    public CalendarioDto.EventoDto actualizarEvento(CalendarioDto.ActualizarEventoDto eventoDto) {
        try {
            // Actualizar en BD local
            EventoCalendario eventoLocal = eventoRepository.findById(Long.parseLong(eventoDto.idEvento()))
                    .orElseThrow(() -> new ModelNotFoundException("Evento no encontrado"));

            eventoLocal.setTitulo(eventoDto.titulo());
            eventoLocal.setDescripcion(eventoDto.descripcion());
            eventoLocal.setFechaInicio(eventoDto.fechaInicio());
            eventoLocal.setFechaFin(eventoDto.fechaFin());
            eventoLocal.setUbicacion(eventoDto.ubicacion());

            // Actualizar en Google Calendar
            if (eventoLocal.getGoogleEventId() != null) {
                Event googleEvent = googleCalendar.events().get(CALENDAR_ID, eventoLocal.getGoogleEventId()).execute();

                googleEvent.setSummary(eventoDto.titulo());
                googleEvent.setDescription(eventoDto.descripcion());
                googleEvent.setLocation(eventoDto.ubicacion());

                EventDateTime inicio = new EventDateTime()
                        .setDateTime(convertirADateTime(eventoDto.fechaInicio()))
                        .setTimeZone("America/Lima");
                googleEvent.setStart(inicio);

                EventDateTime fin = new EventDateTime()
                        .setDateTime(convertirADateTime(eventoDto.fechaFin()))
                        .setTimeZone("America/Lima");
                googleEvent.setEnd(fin);

                googleCalendar.events().update(CALENDAR_ID, eventoLocal.getGoogleEventId(), googleEvent).execute();
                eventoLocal.setFechaSincronizacion(LocalDateTime.now());
            }

            eventoRepository.save(eventoLocal);
            return convertirAEventoDtoLocal(eventoLocal);

        } catch (IOException e) {
            throw new ModelNotFoundException("Error al actualizar evento: " + e.getMessage());
        }
    }

    @Override
    @Transactional
    public void eliminarEvento(String idEvento) {
        try {
            EventoCalendario eventoLocal = eventoRepository.findById(Long.parseLong(idEvento))
                    .orElseThrow(() -> new ModelNotFoundException("Evento no encontrado"));

            // Eliminar de Google Calendar
            if (eventoLocal.getGoogleEventId() != null) {
                googleCalendar.events().delete(CALENDAR_ID, eventoLocal.getGoogleEventId()).execute();
            }

            // Eliminar asistentes
            asistenteRepository.deleteByEventoId(eventoLocal.getIdEventoLocal());

            // Eliminar de BD local
            eventoRepository.delete(eventoLocal);

        } catch (IOException e) {
            throw new ModelNotFoundException("Error al eliminar evento: " + e.getMessage());
        }
    }

    @Override
    public List<CalendarioDto.EventoDto> obtenerEventosDelDia(LocalDate fecha) {
        LocalDateTime inicio = fecha.atStartOfDay();
        LocalDateTime fin = fecha.atTime(23, 59, 59);

        List<EventoCalendario> eventos = eventoRepository.findEventosPorRangoFecha(inicio, fin);
        return eventos.stream()
                .map(this::convertirAEventoDtoLocal)
                .collect(Collectors.toList());
    }

    @Override
    public List<CalendarioDto.EventoDto> obtenerProximosEventos(Integer cantidad) {
        List<EventoCalendario> eventos = eventoRepository.findProximosEventos(LocalDateTime.now());
        return eventos.stream()
                .limit(cantidad != null ? cantidad : 10)
                .map(this::convertirAEventoDtoLocal)
                .collect(Collectors.toList());
    }

    // Métodos auxiliares
    private DateTime convertirADateTime(LocalDateTime localDateTime) {
        if (localDateTime == null) return null;
        Date date = Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
        return new DateTime(date);
    }

    private CalendarioDto.EventoDto convertirAEventoDto(EventoCalendario eventoLocal, Event googleEvent) {
        List<EventoAsistente> asistentes = asistenteRepository.findByEventoId(eventoLocal.getIdEventoLocal());

        List<CalendarioDto.AsistenteDto> asistentesDto = asistentes.stream()
                .map(a -> new CalendarioDto.AsistenteDto(
                        a.getEmail(),
                        a.getEmail(),
                        a.getEstadoConfirmacion().name(),
                        false
                ))
                .collect(Collectors.toList());

        // Generar enlace para agregar a Google Calendar (público)
        String enlaceAgregarCalendario = generarEnlaceAgregarGoogleCalendar(eventoLocal);

        return new CalendarioDto.EventoDto(
                eventoLocal.getIdEventoLocal().toString(),
                eventoLocal.getTitulo(),
                eventoLocal.getDescripcion(),
                eventoLocal.getFechaInicio(),
                eventoLocal.getFechaFin(),
                eventoLocal.getUbicacion(),
                eventoLocal.getEstado().name(),
                enlaceAgregarCalendario, // Usar enlace público
                asistentesDto
        );
    }

    private CalendarioDto.EventoDto convertirAEventoDtoLocal(EventoCalendario evento) {
        List<EventoAsistente> asistentes = asistenteRepository.findByEventoId(evento.getIdEventoLocal());

        List<CalendarioDto.AsistenteDto> asistentesDto = asistentes.stream()
                .map(a -> new CalendarioDto.AsistenteDto(
                        a.getEmail(),
                        a.getEmail(),
                        a.getEstadoConfirmacion().name(),
                        false
                ))
                .collect(Collectors.toList());

        return new CalendarioDto.EventoDto(
                evento.getIdEventoLocal().toString(),
                evento.getTitulo(),
                evento.getDescripcion(),
                evento.getFechaInicio(),
                evento.getFechaFin(),
                evento.getUbicacion(),
                evento.getEstado().name(),
                null,
                asistentesDto
        );
    }

    // Método auxiliar para generar enlace público
    private String generarEnlaceAgregarGoogleCalendar(EventoCalendario evento) {
        try {
            // Formato de fecha para Google Calendar: yyyyMMddTHHmmssZ
            java.time.format.DateTimeFormatter formatter =
                    java.time.format.DateTimeFormatter.ofPattern("yyyyMMdd'T'HHmmss");

            String fechaInicio = evento.getFechaInicio()
                    .atZone(ZoneId.of("America/Lima"))
                    .format(formatter);
            String fechaFin = evento.getFechaFin()
                    .atZone(ZoneId.of("America/Lima"))
                    .format(formatter);

            // Construir URL para agregar evento a Google Calendar
            String titulo = java.net.URLEncoder.encode(evento.getTitulo(), "UTF-8");
            String descripcion = evento.getDescripcion() != null ?
                    java.net.URLEncoder.encode(evento.getDescripcion(), "UTF-8") : "";
            String ubicacion = evento.getUbicacion() != null ?
                    java.net.URLEncoder.encode(evento.getUbicacion(), "UTF-8") : "";

            return String.format(
                    "https://calendar.google.com/calendar/render?action=TEMPLATE&text=%s&dates=%s/%s&details=%s&location=%s",
                    titulo, fechaInicio, fechaFin, descripcion, ubicacion
            );

        } catch (Exception e) {
            return null;
        }
    }
}
