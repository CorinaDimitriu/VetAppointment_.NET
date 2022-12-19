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
        }
        [HttpGet("{drugId:Guid}")]
        public async Task<DrugResponse> Get(Guid drugId)
        {
            return await mediator.Send(new GetDrugQuery(drugId));
        }
        [HttpPost]
        public async Task<ActionResult<DrugResponse>> Create([FromBody] CreateDrugCommand drugCommnad)
        {
            var result = await mediator.Send(drugCommnad);
            return Ok(result);
        }

        [HttpDelete("{drugId:Guid}")]
        public async Task<ActionResult> Delete(Guid drugId)
        {
            await mediator.Send(new DeleteDrugQuery(drugId));
            return Ok();
        }

        [HttpPut("{drugId:Guid}")]
        public async Task<ActionResult<DrugResponse>> Update(Guid drugId, [FromBody] CreateDrugCommand drugCommnand)
        {
            var result = await mediator.Send(new UpdateDrugQuery(drugId, drugCommnand));
            return Ok(result);
        }
    }
}