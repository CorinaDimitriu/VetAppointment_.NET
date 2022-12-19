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
    public class TreatmentsController : ControllerBase
    {
        private readonly IUnitOfWork unitOfWork;
        public TreatmentsController(IUnitOfWork unitOfWork) => this.unitOfWork = unitOfWork;

        [HttpGet]
        public IActionResult Get()
        {
            var treatments = unitOfWork.TreatmentRepository.All().Result.Select (TreatmentMapper.Mapper.Map<TreatmentDto>);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(treatments);
        }

        [HttpPost]
        public IActionResult Create([FromBody] CreateTreatmentDto treatmentDto)
        {
            var treat = TreatmentMapper.Mapper.Map<Treatment>(treatmentDto);
            if (treat == null)
            {
                return BadRequest();
            }

            unitOfWork.TreatmentRepository.Add(treat);
            unitOfWork.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Created(nameof(Get), TreatmentMapper.Mapper.Map<TreatmentDto>(treat));
        }

        [HttpPost("{treatmentId:Guid}/prescribedDrugs")]
        public IActionResult AddDrugsToTreatment(Guid treatmentId, [FromBody] List<PrescribedDrugDto> prescribedDrugDtos)
        {
            var treatment = unitOfWork.TreatmentRepository.Get(treatmentId).Result;
            if (treatment == null)
            {
                return NotFound();
            }

            var drugs = prescribedDrugDtos.Select(PrescribedDrugMapper.Mapper.Map<PrescribedDrug>).ToList();
            if (drugs.Any(p => p == null))
            {
                return BadRequest();
            }

            var result = treatment.AppendDrugsToTreatment(drugs);
            if (result.IsFailure)
            {
                return BadRequest(result.Error);
            }

            drugs.ForEach(p => unitOfWork.PrescribedDrugRepository.Add(p));
            unitOfWork.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return NoContent();
        }

        [HttpPut("{treatmentId:Guid}")]
        public IActionResult UpdateTreatment(Guid treatmentId, [FromBody] CreateTreatmentDto treatmentDto)
        {
            var treatment = unitOfWork.TreatmentRepository.Get(treatmentId).Result;
            if (treatment == null)
            {
                return NotFound();
            }

            var result = treatment.UpdateDescription(treatmentDto.Description);
            if (result.IsFailure)
            {
                return BadRequest(result.Error);
            }

            unitOfWork.TreatmentRepository.Update(treatment);
            unitOfWork.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return NoContent();
        }

        [HttpPut("{treatmentId:Guid}/prescribedDrug/{prescribedDrugId:Guid}")]
        public IActionResult UpdateDrugInTreatment(Guid treatmentId, Guid prescribedDrugId, 
            [FromBody] PrescribedDrugDto prescribedDrugDto)
        {
            var treatment = unitOfWork.TreatmentRepository.Get(treatmentId).Result;
            if (treatment == null)
            {
                return NotFound();
            }

            var drugPrescribed = unitOfWork.PrescribedDrugRepository.Get(prescribedDrugId).Result;
            if (drugPrescribed == null)
            {
                return NotFound();
            }

            var drug = unitOfWork.DrugRepository.Get(prescribedDrugDto.DrugId).Result;
            if (drug == null)
            {
                return NotFound();
            }

            var result = drugPrescribed.Update(prescribedDrugDto.Quantity, drug);

            if (result.IsFailure)
            {
                return BadRequest(result.Error);
            }

            unitOfWork.PrescribedDrugRepository.Update(drugPrescribed);
            unitOfWork.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return NoContent();
        }

        [HttpDelete("{treatmentId:Guid}/prescribedDrug/{prescribedDrugId:Guid}")]
        public IActionResult RemoveDrugFromTreatment(Guid treatmentId, Guid prescribedDrugId)
        {
            var treatment = unitOfWork.TreatmentRepository.Get(treatmentId).Result;
            if (treatment == null)
            {
                return NotFound();
            }

            var drug = unitOfWork.PrescribedDrugRepository.Get(prescribedDrugId).Result;
            if (drug == null)
            {
                return NotFound();
            }

            var result = treatment.RemoveDrugFromTreatment(drug);
            if (result.IsFailure)
            {
                return BadRequest(result.Error);
            }

            unitOfWork.PrescribedDrugRepository.Delete(drug);
            unitOfWork.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return NoContent();
        }

        [HttpDelete("{treatmentId:Guid}")]
        public IActionResult Delete(Guid treatmentId)
        {
            var treatment = unitOfWork.TreatmentRepository.Get(treatmentId).Result;
            if (treatment == null)
            {
                return NotFound();
            }

            unitOfWork.TreatmentRepository.Delete(treatment);
            unitOfWork.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return NoContent();
        }

    }
}
