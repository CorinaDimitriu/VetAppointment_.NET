using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Dtos;
using VetAppointment.Application.Repositories;
using VetAppointment.Domain.Models;

namespace VetAppointment.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AppointmentsController : ControllerBase
    {
        private readonly IAppointmentRepository repository;

        public AppointmentsController(IAppointmentRepository repository)
        {
            this.repository = repository;
        }

        [HttpPost]

        public IActionResult Create([FromBody] CreateAppointmentDto appointmentDto)
        {
            var appointment = Appointment.SettleAppointment(
                appointmentDto.VetId,
                appointmentDto.PetId,
                appointmentDto.ScheduledDate,
                appointmentDto.EstimatedDurationInMinutes
                );
            if (appointment.IsSuccess)
            {
                repository.Add(appointment.Entity);
                var fullAppointment = new AppointmentDto
                {
                    Id = appointment.Entity.Id,
                    VetId = appointment.Entity.VetId,
                    PetId = appointment.Entity.PetId,
                    ScheduledDate = appointment.Entity.ScheduledDate,
                    EstimatedDurationInMinutes = appointment.Entity.EstimatedDurationInMinutes
                };

                return Created(nameof(GetAllAppointments), fullAppointment);
            }

            return BadRequest(appointment.Error);
        }

        [HttpGet]

        public IActionResult GetAllAppointments()
        {
            var appointments = repository.GetAll().Select(appointment => new AppointmentDto()
            {
                Id = appointment.Id,
                VetId = appointment.VetId,
                PetId = appointment.PetId,
                ScheduledDate = appointment.ScheduledDate,
                EstimatedDurationInMinutes = appointment.EstimatedDurationInMinutes
            });
            return Ok(appointments);
        }
    }
}
