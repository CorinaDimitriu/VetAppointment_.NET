using MediatR;
using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.Application.Commands;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Queries;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.API.Controllers
{
    [Route("v1/api/[controller]")]
    [ApiController]
    public class DrugsController : ControllerBase
    {
        private readonly IMediator mediator;

        public DrugsController(IMediator mediator)
        {
            this.mediator = mediator;
        }

        [HttpGet]
        public async Task<List<DrugResponse>> Get()
        {
            return await mediator.Send(new GetAllDrugsQuery());
        
        /*var drugs = drugRepository.All().Result.Select(DrugMapper.Mapper.Map<DrugDto>);

        Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
        Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
        Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
        return Ok(drugs);
        */
        }
        [HttpGet("{drugId:Guid}")]
        public async Task<DrugResponse> Get(Guid drugId)
        {
            return await mediator.Send(new GetDrugQuery(drugId));
        
        /*
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
        */
        }
        [HttpPost]
        public async Task<ActionResult<DrugResponse>> Create([FromBody] CreateDrugCommand drugCommnad)
        {
            var result = await mediator.Send(drugCommnad);
            return Ok(result);
            //var validatorResult = createDrugDtoValidator.Validate(drugDto);
            //if (!validatorResult.IsValid)
            //{
            //    return BadRequest(validatorResult.Errors);
            //}
            
            //var drug = DrugMapper.Mapper.Map<Drug>(drugDto);

            //if (drug == null)
            //{
            //    return BadRequest();
            //}

            //drugRepository.Add(drug);
            //drugRepository.SaveChanges();

            //Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            //Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            //Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            //return Created(nameof(Get), DrugMapper.Mapper.Map<DrugDto>(drug));
        }

        [HttpDelete("{drugId:Guid}")]
        public async Task<ActionResult> Delete(Guid drugId)
        {
            var result = await mediator.Send(new DeleteDrugQuery(drugId));
            return Ok();
            //var drug = drugRepository.Get(drugId).Result;
            //if (drug == null)
            //{
            //    return NotFound();
            //}
            
            //drugRepository.Delete(drug);
            //drugRepository.SaveChanges();

            //Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            //Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            //Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            //return Ok();
        }

        [HttpPut("{drugId:Guid}")]
        public async Task<ActionResult<DrugResponse>> Update(Guid drugId, [FromBody] CreateDrugCommand drugCommnand)
        {
            var result = await mediator.Send(new UpdateDrugQuery(drugId, drugCommnand));
            return Ok(result);

            //var drug = drugRepository.Get(drugId).Result;
            //if (drug == null)
            //{
            //    return NotFound();
            //}

            //var validatorResult = createDrugDtoValidator.Validate(drugDto);
            //if (!validatorResult.IsValid)
            //{
            //    return BadRequest(validatorResult.Errors);
            //}

            //drug.Update(drugDto.Name, drugDto.Quantity, drugDto.UnitPrice);

            //drugRepository.Update(drug);
            //drugRepository.SaveChanges();

            //Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            //Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            //Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            //return Ok(DrugMapper.Mapper.Map<DrugDto>(drug));
        }
    }
}