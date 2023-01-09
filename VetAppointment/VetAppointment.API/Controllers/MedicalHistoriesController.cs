using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.API.Mappers;
using VetAppointment.Domain;
using VetAppointment.Application;

namespace VetAppointment.API.Controllers
{
    [Route("v{version:apiVersion}/api/[controller]")]
    [ApiController]
    [ApiVersion("1")]
    public class MedicalHistoriesController : ControllerBase
    {
        private readonly IUnitOfWork unitOfWork;

        private void SetResponseHeader()
        {
            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
        }
        public MedicalHistoriesController(IUnitOfWork unitOfWork) => this.unitOfWork = unitOfWork;

        [HttpGet]
        public IActionResult Get()
        {
            var medicalHistories = unitOfWork.MedicalHistoryRepository 
                .All().Result.Select(MedicalHistoryMapper.Mapper.Map<MedicalHistoryDto>);

            SetResponseHeader();

            return Ok(medicalHistories);
        }

        [HttpGet("{clinicId:Guid}")]
        public IActionResult GetByClinicId(Guid clinicId)
        {
            var clinic = unitOfWork.VetClinicRepository.Get(clinicId).Result;
            if (clinic == null)
            {
                return NotFound();
            }
            var medicalHistory = MedicalHistoryMapper.Mapper
                .Map<MedicalHistoryDto>(unitOfWork.MedicalHistoryRepository
                .Find(md => md.ClinicId == clinicId));
            if (medicalHistory == null)
            {
                return NotFound();
            }

            SetResponseHeader();

            return Ok(medicalHistory);
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

            SetResponseHeader();
            return Created(nameof(Post), AppointmentMapper.Mapper.Map<AppointmentDto>(appointment.Entity));
        }
    }
}
