using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.API.Mappers;
using VetAppointment.Domain;
using VetAppointment.Application;
using VetAppointment.Infrastructure.Repositories.GenericRepositories;
using Microsoft.AspNetCore.Authorization;

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
            var treatments = unitOfWork.TreatmentRepository.All().Result.Select(TreatmentMapper.Mapper.Map<TreatmentDto>);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(treatments);
        }

        [HttpGet("{treatmentId:guid}")]
        public IActionResult GetById(Guid treatmentId)
        {
            var treatment = unitOfWork.TreatmentRepository.Get(treatmentId).Result;
            if (treatment == null)
            {
                return NotFound();
            }

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(treatment);
        }

        [HttpPost]
        [Authorize(Roles = "Admin_Vet")]
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

        [HttpGet("{treatmentId:guid}/prescribeddrugs")]
        public IActionResult GetPrescribedDrugsByTreatmentId(Guid treatmentId)
        {
            var treatment = unitOfWork.TreatmentRepository.Get(treatmentId).Result;
            if (treatment == null)
            {
                return NotFound();
            }

            var prescribedDrugs = treatment.PrescribedDrugs.Select(PrescribedDrugMapper.Mapper.Map<PrescribedDrugDto>);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(prescribedDrugs);
        }

        [HttpPost("{treatmentId:Guid}/prescribedDrugs")]
        [Authorize(Roles = "Admin_Vet")]
        public IActionResult AddDrugsToTreatment(Guid treatmentId, [FromBody] List<CreatePrescribedDrugDto> prescribedDrugDtos)
        {
            var treatment = unitOfWork.TreatmentRepository.Get(treatmentId).Result;
            if (treatment == null)
            {
                return NotFound();
            }

            var realDrugs = prescribedDrugDtos.Select(drugDto => unitOfWork.DrugRepository.Get(drugDto.DrugToPrescribeId).Result).ToList();
            foreach (var drug in realDrugs)
            {
                unitOfWork.DrugRepository.Update(drug);
            }

            var drugs = prescribedDrugDtos.Select(drugDto =>
            PrescribedDrug.Create(drugDto.Quantity, unitOfWork.DrugRepository.Get(drugDto.DrugToPrescribeId).Result).Entity).ToList();

            if (drugs.Any(p => p == null))
            {
                return BadRequest();
            }

            var result = treatment.AppendDrugsToTreatment(drugs.Select(drug => drug).ToList());
            if (result.IsFailure)
            {
                return BadRequest(result.Error);
            }

            drugs.ForEach(p => unitOfWork.PrescribedDrugRepository.Add(p));
            unitOfWork.TreatmentRepository.Update(treatment);
            unitOfWork.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Created(nameof(GetPrescribedDrugsByTreatmentId), drugs.Select(PrescribedDrugMapper.Mapper.Map<PrescribedDrugDto>));
        }

        [HttpPut("{treatmentId:Guid}")]
        [Authorize(Roles = "Admin_Vet")]
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
        [Authorize(Roles = "Admin_Vet")]
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

            var drug = unitOfWork.DrugRepository.Get(prescribedDrugDto.DrugToPrescribeId).Result;
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
        [Authorize(Roles = "Admin_Vet")]
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
        [Authorize(Roles = "Admin_Vet")]
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
