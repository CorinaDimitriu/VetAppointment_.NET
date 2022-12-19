using MediatR;
using Microsoft.AspNetCore.Mvc;
using VetAppointment.Application.Commands.VetClinics;
using VetAppointment.Application.Commands.Vets;
using VetAppointment.Application.Queries.VetClinics.Pets;
using VetAppointment.Application.Queries.VetClinics.Vets;
using VetAppointment.Application.Queries.VetClinics;
using VetAppointment.Application.Response;

namespace VetAppointment.API.Controllers.v2
{
    [ApiController]
    [Route("v{version:apiVersion}/api/[controller]")]
    [ApiVersion("2")]

    public class VetClinicsController : ControllerBase
    {
        private readonly IMediator mediator;

        private void AccessControl()
        {
            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
        }

        public VetClinicsController(IMediator mediator) => this.mediator = mediator;

        [HttpPost]
        public async Task<ActionResult<VetClinicResponse>> Post([FromBody] CreateVetClinicCommand command)
        {
            var result = await mediator.Send(command);
            if (result == null)
            {
                return BadRequest();
            }

            AccessControl();
            return Created(nameof(Get), result);
        }

        [HttpPost("{vetClinicId:Guid}/vet")]
        public async Task<ActionResult<VetResponse>> PostVet(Guid vetClinicId, [FromBody] CreateVetCommand command)
        {
            var vet = await mediator.Send(command);
            if (vet == null)
            {
                return BadRequest();
            }

            var response = await mediator.Send(new PostVetInVetClinicQuery(vetClinicId, vet.Id));
            if (response == null)
            {
                return NotFound();
            }

            AccessControl();
            return Created(nameof(GetVet), response);
        }

        [HttpGet]
        public async Task<ActionResult<List<VetClinicResponse>>> GetAll()
        {
            var result = await mediator.Send(new GetAllVetClinicsQuery());

            AccessControl();
            return Ok(result);

        }

        [HttpGet("{vetClinicId:Guid}")]
        public async Task<ActionResult<VetClinicResponse>> Get(Guid vetClinicId)
        {
            var result = await mediator.Send(new GetVetClinicQuery(vetClinicId));
            if (result == null)
            {
                return NotFound();
            }

            AccessControl();
            return Ok(result);
        }

        [HttpGet("{vetClinicId:Guid}/vets")]
        public async Task<ActionResult<List<VetResponse>>> GetAllVets(Guid vetClinicId)
        {
            var result = await mediator.Send(new GetAllVetsFromVetClinicQuery(vetClinicId));
            if (result == null)
            {
                return NotFound();
            }

            AccessControl();
            return Ok(result);
        }

        [HttpGet("{vetClinicId:Guid}/{vetId:Guid}")]
        public async Task<ActionResult<VetResponse>> GetVet(Guid vetClinicId, Guid vetId)
        {
            var result = await mediator.Send(new GetVetFromVetClinicQuery(vetClinicId, vetId));
            if (result == null)
            {
                return NotFound();
            }

            AccessControl();
            return Ok(result);
        }

        [HttpGet("{vetClinicId:Guid}/{petOwnerId:Guid}/pets")]
        public async Task<ActionResult<List<PetResponse>>> GetPets(Guid vetClinicId, Guid petOwnerId)
        {
            var result = await mediator.Send(new GetAllPetsFromClinicAndOwnerQuery(vetClinicId, petOwnerId));
            if (result == null)
            {
                return NotFound();
            }

            AccessControl();
            return Ok(result);
        }

        [HttpPut("{vetClinicId:Guid}")]
        public async Task<ActionResult<VetClinicResponse>> Put(Guid vetClinicId, [FromBody] CreateVetClinicCommand command)
        {
            var result = await mediator.Send(new UpdateVetClinicQuery(vetClinicId, command));

            AccessControl();

            if (result == ResponseStatusCodes.NotFound)
            {
                return NotFound();
            }
            else if (result == ResponseStatusCodes.BadRequest)
            {
                return BadRequest();
            }
            else
            {
                return Ok();
            }
        }

        [HttpPut("{vetClinicId:Guid}/vet/{vetId:Guid}")]
        public async Task<ActionResult<VetResponse>> PutVet(Guid vetClinicId, Guid vetId,
            [FromBody] CreateVetCommand command)
        {
            var result = await mediator.Send(new UpdateVetFromVetClinicQuery(vetClinicId, vetId, command));

            AccessControl();
            if (result == ResponseStatusCodes.NotFound)
            {
                return NotFound();
            }
            else if (result == ResponseStatusCodes.BadRequest)
            {
                return BadRequest();
            }
            else
            {
                return Ok();
            }
        }

        [HttpDelete("{vetClinicId:Guid}")]
        public async Task<ActionResult> Delete(Guid vetClinicId)
        {
            var result = await mediator.Send(new DeleteVetClinicQuery(vetClinicId));
            if (result == null)
            {
                return NotFound();
            }

            AccessControl();
            return NoContent();
        }

        [HttpDelete("{vetClinicId:Guid}/vet/{vetId:Guid}")]
        public async Task<ActionResult> DeleteVet(Guid vetClinicId, Guid vetId)
        {
            var result = await mediator.Send(new DeleteVetFromVetClinicQuery(vetClinicId, vetId));
            if (result == null)
            {
                return NotFound();
            }

            AccessControl();
            return NoContent();
        }
    }
}