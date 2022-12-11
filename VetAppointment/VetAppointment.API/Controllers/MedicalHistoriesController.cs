using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.API.Mappers;
using VetAppointment.Domain;
using VetAppointment.Infrastructure.Data;

namespace VetAppointment.API.Controllers
{
    [Route("v1/api/[controller]")]
    [ApiController]
    public class MedicalHistoriesController : ControllerBase
    {
        private readonly IUnitOfWork unitOfWork;

        public MedicalHistoriesController(IUnitOfWork unitOfWork) => this.unitOfWork = unitOfWork;

        [HttpGet]
        public IActionResult Get()
        {
            var medicalHistories = unitOfWork.MedicalHistoryRepository 
                .All().Result.Select(MedicalHistoryMapper.Mapper.Map<MedicalHistoryDto>);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");

            return Ok(medicalHistories);
        }

        [HttpPost("{medicalHistoryId:Guid}/appointment")]
        public IActionResult Post(Guid medicalHistoryId, [FromBody] CreateAppointmentDto appointmentDto)
        {
            var medicalHistory = unitOfWork.MedicalHistoryRepository.Get(medicalHistoryId).Result;
            if (medicalHistory == null)
            {
                return NotFound();
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
            if (appointment.IsFailure)
            {
                return BadRequest(appointment.Error);
            }

            var result = medicalHistory.RegisterAppointmentToHistory(appointment.Entity);
            if (result.IsFailure)
            {
                return BadRequest(result.Error);
            }

            unitOfWork.AppointmentRepository.Add(appointment.Entity);
            unitOfWork.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Created(nameof(Post), AppointmentMapper.Mapper.Map<AppointmentDto>(appointment.Entity));
        }
    }
}
