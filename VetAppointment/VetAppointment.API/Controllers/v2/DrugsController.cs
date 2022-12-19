using MediatR;
using Microsoft.AspNetCore.Mvc;
using VetAppointment.Application.Commands.Drugs;
using VetAppointment.Application.Queries.Drugs;
using VetAppointment.Application.Response;

namespace VetAppointment.API.Controllers.v2
{
    [Route("v{version:apiVersion}/api/[controller]")]
    [ApiController]
    [ApiVersion("2")]
    public class DrugsController : ControllerBase
    {
        private readonly IMediator mediator;

        public DrugsController(IMediator mediator) => this.mediator = mediator;

        [HttpPost]
        public async Task<ActionResult<DrugResponse>> Create([FromBody] CreateDrugCommand command)
        {
            AccessControl();
            return Created(nameof(Get), await mediator.Send(command));
        }

        [HttpGet]
        public async Task<ActionResult<List<DrugResponse>>> GetAll()
        {
            AccessControl();
            return Ok(await mediator.Send(new GetAllDrugsQuery()));
        }

        [HttpGet("{drugId:Guid}")]
        public async Task<ActionResult<DrugResponse>> Get(Guid drugId)
        {
            var result = await mediator.Send(new GetDrugQuery(drugId));
            if (result == null)
            {
                return NotFound();
            }

            AccessControl();
            return Ok(result);
        }

        [HttpPut]
        public async Task<ActionResult<DrugResponse>> Put([FromBody] UpdateDrugCommand command)
        {
            var result = await mediator.Send(command);
            if (result == null)
            {
                return NotFound();
            }

            AccessControl();
            return Ok(result);
        }

        [HttpDelete]
        public async Task<ActionResult> Delete(DeleteDrugCommand command)
        {
            var result = await mediator.Send(command);
            AccessControl();
            return result ? NoContent() : NotFound();
        }

        private void AccessControl()
        {
            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
        }
    }
}