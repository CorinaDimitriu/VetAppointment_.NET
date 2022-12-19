using MediatR;
using Microsoft.AspNetCore.Mvc;
using VetAppointment.Application.Commands.PrescribedDrug;
using VetAppointment.Application.Queries.Drugs;
using VetAppointment.Application.Queries.PrescribedDrugs;
using VetAppointment.Application.Response;

namespace VetAppointment.API.Controllers.v2
{
    [Route("v{version:apiVersion}/api/[controller]")]
    [ApiController]
    [ApiVersion("2")]
    public class PrescribedDrugsController : ControllerBase
    {
        private readonly IMediator mediator;

        private void AccessControl()
        {
            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
        }

        public PrescribedDrugsController(IMediator mediator) => this.mediator = mediator;

        [HttpPost]
        public async Task<ActionResult<PrescribedDrugResponse>> Create([FromBody] CreatePrescribedDrugCommand command)
        {
            var drug = mediator.Send(new GetDrugQuery(command.DrugToPrescribeId));
            if (drug == null)
            {
                return NotFound();
            }

            AccessControl();
            return Created(nameof(GetById), await mediator.Send(command));
        }

        [HttpGet]
        public async Task<ActionResult<List<PrescribedDrugResponse>>> GetAll()
        {
            AccessControl();
            return Ok(await mediator.Send(new GetAllPrescribedDrugsQuery()));
        }

        [HttpGet("{prescribedDrugId:Guid}")]
        public async Task<ActionResult<PrescribedDrugResponse>> GetById(Guid prescribedDrugId)
        {
            var result = await mediator.Send(new GetPrescribedDrugQuery(prescribedDrugId));
            if (result == null)
            {
                return NotFound();
            }

            AccessControl();
            return Ok(result);
        }

        [HttpPut]
        public async Task<ActionResult<PrescribedDrugResponse>> Update([FromBody] UpdatePrescribedDrugCommand command)
        {
            var drug = await mediator.Send(new GetDrugQuery(command.DrugToPrescribeId));
            if (drug == null)
            {
                return NotFound();
            }

            var result = await mediator.Send(command);
            if (result == null)
            {
                return NotFound();
            }

            AccessControl();
            return Ok(result);
        }

        [HttpDelete]
        public async Task<ActionResult<bool>> Delete([FromBody] DeletePrescribedDrugCommand command)
        {
            var result = await mediator.Send(command);
            AccessControl();
            return result ? Ok() : NotFound();
        }
    }
}
