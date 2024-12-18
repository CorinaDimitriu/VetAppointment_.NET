﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.Application;
using VetAppointment.Domain;

namespace VetAppointment.API.Controllers
{
    [Route("v{version:apiVersion}/api/[controller]")]
    [ApiController]
    [ApiVersion("1")]
    public class AppointmentsController : ControllerBase
    {
        private readonly IUnitOfWork unitOfWork;

        private void SetResponseHeader()
        {
            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
        }
        public AppointmentsController(IUnitOfWork unitOfWork) => this.unitOfWork = unitOfWork;

        [HttpPost]
        public IActionResult Create([FromBody] CreateAppointmentDto appointmentDto)
        {
            var pet = unitOfWork.PetRepository.Get(appointmentDto.PetId).Result;
            if (pet == null)
            {
                return NotFound();
            }

            var vet = unitOfWork.VetRepository.Get(appointmentDto.VetId).Result;
            if (vet == null)
            {
                return NotFound();
            }

            if (vet.ClinicId != pet.ClinicId)
            {
                return BadRequest();
            }

            var appointment = Appointment.SettleAppointment(
                    vet,
                    pet,
                    appointmentDto.ScheduledDate,
                    appointmentDto.EstimatedDurationInMinutes
                );

            var treatement = unitOfWork.TreatmentRepository.Get(appointmentDto.TreatmentId).Result;
            if (treatement == null)
            {
                return NotFound();
            }

            //var history = unitOfWork.MedicalHistoryRepository.Get(appointmentDto.MedicalHistoryId).Result;
            var clinicId = unitOfWork.VetRepository.Get(vet.Id).Result.ClinicId;
            var historyId = unitOfWork.VetClinicRepository.Get(clinicId).Result.MedicalHistoryId;
            var history = unitOfWork.MedicalHistoryRepository.Get(historyId).Result;
            if (history == null)
            {
                return NotFound();
            }

            history.RegisterAppointmentToHistory(appointment.Entity);
            unitOfWork.MedicalHistoryRepository.Update(history);
            unitOfWork.SaveChanges();

            appointment.Entity.AttachTreatmentToAppointment(treatement);

            if (appointment.IsFailure)
            {
                return BadRequest(appointment.Error);
            }

            unitOfWork.AppointmentRepository.Add(appointment.Entity);
            unitOfWork.SaveChanges();
            var fullAppointment = new AppointmentDto
            {
                Id = appointment.Entity.Id,
                VetId = appointment.Entity.VetId,
                PetId = appointment.Entity.PetId,
                ScheduledDate = appointment.Entity.ScheduledDate.ToString(),
                EstimatedDurationInMinutes = appointment.Entity.EstimatedDurationInMinutes
            };

            SetResponseHeader();
            return Created(nameof(GetAllAppointments), fullAppointment);
        }

        [HttpGet]
        public IActionResult GetAllAppointments()
        {
            var appointments = unitOfWork.AppointmentRepository.All().Result.Select(appointment => new AppointmentDto()
            {
                Id = appointment.Id,
                VetId = appointment.VetId,
                PetId = appointment.PetId,
                ScheduledDate = appointment.ScheduledDate.ToString(),
                EstimatedDurationInMinutes = appointment.EstimatedDurationInMinutes,
                TreatmentId = appointment.TreatmentId,
            });

            SetResponseHeader();
            return Ok(appointments);
        }

        [HttpGet("{id}")]
        public IActionResult GetAppointmentById(Guid id)
        {
            var appointment = unitOfWork.AppointmentRepository.Get(id).Result;
            if (appointment == null)
            {
                return NotFound();
            }

            var appointmentDto = new AppointmentDto
            {
                Id = appointment.Id,
                VetId = appointment.VetId,
                PetId = appointment.PetId,
                ScheduledDate = appointment.ScheduledDate.ToString(),
                EstimatedDurationInMinutes = appointment.EstimatedDurationInMinutes,
                TreatmentId = appointment.TreatmentId,
            };

            SetResponseHeader();
            return Ok(appointmentDto);
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteAppointment(Guid id)
        {
            var appointment = unitOfWork.AppointmentRepository.Get(id).Result;
            if (appointment == null)
            {
                return NotFound();
            }

            unitOfWork.AppointmentRepository.Delete(appointment);
            unitOfWork.SaveChanges();

            SetResponseHeader();
            return NoContent();
        }

        [HttpPut("{id}")]
        public IActionResult UpdateAppointment(Guid id, [FromBody] AppointmentDto appointmentDto)
        {
            var appointment = unitOfWork.AppointmentRepository.Get(id).Result;
            if (appointment == null)
            {
                return NotFound();
            }

            var vetAppointments = unitOfWork.AppointmentRepository.All().Result.Where(a => a.VetId == appointmentDto.VetId).ToList();

            var newAppStartDate = DateTime.Parse(appointmentDto.ScheduledDate);
            var newAppEndDate = DateTime.Parse(appointmentDto.ScheduledDate).AddMinutes(appointmentDto.EstimatedDurationInMinutes);
            foreach (Appointment app in vetAppointments)
            {
                if (app.Id != appointment.Id)
                {
                    var appStartDate = app.ScheduledDate;
                    var appEndDate = app.ScheduledDate.AddMinutes(app.EstimatedDurationInMinutes);

                    if (newAppStartDate >= appStartDate && newAppStartDate <= appEndDate ||
                    newAppEndDate >= appStartDate && newAppEndDate <= appEndDate ||
                    appStartDate >= newAppStartDate && appStartDate <= newAppEndDate ||
                    appEndDate >= newAppStartDate && appEndDate <= newAppEndDate)
                    {
                        return Conflict("Vet is busy at this time");
                    }
                }
            }

            appointment.Update(appointment.VetId, appointmentDto.PetId, appointmentDto.ScheduledDate,
                appointmentDto.EstimatedDurationInMinutes, appointmentDto.TreatmentId);

            unitOfWork.AppointmentRepository.Update(appointment);
            unitOfWork.SaveChanges();

            SetResponseHeader();
            return NoContent();
        }
    }
}
