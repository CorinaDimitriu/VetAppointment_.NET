using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.API.Mappers;
using VetAppointment.Application;
using VetAppointment.Domain;

namespace VetAppointment.API.Controllers
{
    [Route("v{version:apiVersion}/api/[controller]")]
    [ApiController]
    [ApiVersion("1")]
    public class DrugsController : ControllerBase
    {
        private readonly IRepository<Drug> drugRepository;

        public DrugsController(IRepository<Drug> drugRepository) => this.drugRepository = drugRepository;

        [HttpGet]
        public IActionResult Get()
        {
            var drugs = drugRepository.All().Result.Select(DrugMapper.Mapper.Map<DrugDto>);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(drugs);
        }

        [HttpGet("{drugId:Guid}")]
        public IActionResult Get(Guid drugId)
        {
            var drug = drugRepository.Get(drugId).Result;

            if (drug == null)
            {
                return NotFound();
            }

            var drugDto = DrugMapper.Mapper.Map<DrugDto>(drug);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(drugDto);
        }
        
        [HttpPost]
        [Authorize(Roles = "Admin_Vet")]
        public IActionResult Create([FromBody] CreateDrugDto drugDto)
        {
            var drug = DrugMapper.Mapper.Map<Drug>(drugDto);

            if (drug == null)
            {
                return BadRequest();
            }

            drugRepository.Add(drug);
            drugRepository.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Created(nameof(Get), DrugMapper.Mapper.Map<DrugDto>(drug));
        }

        [HttpDelete("{drugId:Guid}")]
        [Authorize(Roles = "Admin_Vet")]
        public IActionResult Delete(Guid drugId)
        {
            var drug = drugRepository.Get(drugId).Result;
            if (drug == null)
            {
                return NotFound();
            }
            
            drugRepository.Delete(drug);
            drugRepository.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok();
        }

        [HttpPut("{drugId:Guid}")]
        [Authorize(Roles = "Admin_Vet")]
        public IActionResult Update(Guid drugId, [FromBody] CreateDrugDto drugDto)
        {
            var drug = drugRepository.Get(drugId).Result;
            if (drug == null)
            {
                return NotFound();
            }

            drug.Update(drugDto.Name, drugDto.Quantity, drugDto.UnitPrice);

            drugRepository.Update(drug);
            drugRepository.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(DrugMapper.Mapper.Map<DrugDto>(drug));
        }
    }
}