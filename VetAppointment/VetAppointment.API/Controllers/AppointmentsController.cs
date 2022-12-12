using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.API.Validators;
using VetAppointment.Domain;
using VetAppointment.Infrastructure.Data;

namespace VetAppointment.API.Controllers
{
    [Route("v1/api/[controller]")]
    [ApiController]
    public class AppointmentsController : ControllerBase
    {
        private readonly IUnitOfWork unitOfWork;
        private readonly CreateAppointmentDtoValidator createAppointmentDtoValidator = new();

        public AppointmentsController(IUnitOfWork unitOfWork) => this.unitOfWork = unitOfWork;

        [HttpPost]
        public IActionResult Create([FromBody] CreateAppointmentDto appointmentDto)
        {
            var validatorResult = createAppointmentDtoValidator.Validate(appointmentDto);
            if (!validatorResult.IsValid)
            {
                return BadRequest(validatorResult.Errors);
            }
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
            
            var appointment = Appointment.SettleAppointment(
                    vet,
                    pet,
                    appointmentDto.ScheduledDate,
                    appointmentDto.EstimatedDurationInMinutes
                );

            var treatement = unitOfWork.TreatmentRepository.Get(appointmentDto.TreatmentId).Result;
            if (treatement == null )
            {
                return NotFound();
            }

            var history = unitOfWork.MedicalHistoryRepository.Get(appointmentDto.MedicalHistoryId).Result;
            if (history == null)
            {
                return NotFound();
            }

            history.RegisterAppointmentToHistory(appointment.Entity);
            unitOfWork.MedicalHistoryRepository.Update(history);
            unitOfWork.SaveChanges();

            appointment.Entity.AttachTreatmentToAppointment(treatement);
            appointment.Entity.AttachAppointmentToMedicalHistory(history);


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

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
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
                MedicalHistoryId = appointment.MedicalHistoryId
            });

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
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
                MedicalHistoryId = appointment.MedicalHistoryId
            };

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
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

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
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

            var validatorResult = createAppointmentDtoValidator.Validate(appointmentDto);
            if (!validatorResult.IsValid)
            {
                return BadRequest(validatorResult.Errors);
            }

            appointment.Update(appointment.VetId, appointmentDto.PetId, appointmentDto.ScheduledDate,
                appointmentDto.EstimatedDurationInMinutes, appointmentDto.TreatmentId, appointmentDto.MedicalHistoryId);

            unitOfWork.AppointmentRepository.Update(appointment);
            unitOfWork.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return NoContent();
        }
    }
}
