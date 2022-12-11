using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.API.Mappers;
using VetAppointment.Application;
using VetAppointment.Domain;

namespace VetAppointment.API.Controllers
{
    [Route("v1/api/[controller]")]
    [ApiController]
    public class PrescribedDrugsController : ControllerBase
    {
        private readonly IRepository<PrescribedDrug> prescribedDrugRepository;
        private readonly IRepository<Drug> drugRepository;

        public PrescribedDrugsController(IRepository<PrescribedDrug> prescribedDrugRepository, IRepository<Drug> drugRepository)
        {
            this.prescribedDrugRepository = prescribedDrugRepository;
            this.drugRepository = drugRepository;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var drugs = prescribedDrugRepository.All().Result.Select(PrescribedDrugMapper.Mapper.Map<PrescribedDrugDto>);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(drugs);
        }

        [HttpPost]
        public IActionResult Create([FromBody] CreatePrescribedDrugDto drugDto)
        {
            var drug = drugRepository.Get(drugDto.DrugId).Result;
            if (drug == null)
            {
                return NotFound();
            }
            
            var prescribedDrug = PrescribedDrugMapper.Mapper.Map<PrescribedDrug>(drugDto);
            if (prescribedDrug == null)
            {
                return BadRequest();
            }

            prescribedDrugRepository.Add(prescribedDrug);
            prescribedDrugRepository.SaveChanges();
            
            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Created(nameof(Get), PrescribedDrugMapper.Mapper.Map<PrescribedDrugDto>(prescribedDrug));
        }
    }
}
