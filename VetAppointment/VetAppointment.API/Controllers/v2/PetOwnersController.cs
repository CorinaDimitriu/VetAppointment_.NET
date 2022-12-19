using MediatR;
using Microsoft.AspNetCore.Mvc;
using VetAppointment.Application.Commands.PetOwners;
using VetAppointment.Application.Commands.Pets;
using VetAppointment.Application.Queries.PetOwners;
using VetAppointment.Application.Response;

namespace VetAppointment.API.Controllers.v2
{
    [Route("v{version:ApiVersion}/api/[controller]")]
    [ApiController]
    [ApiVersion("2")]
    public class PetOwnersController : ControllerBase
    {
        private readonly IMediator mediator;

        public PetOwnersController(IMediator medediator)
        {
            this.mediator= medediator;
        }

        [HttpGet]
        public async Task<List<PetOwnerResponse>> Get()
        {
            return await mediator.Send(new GetAllPetOwnersQuery());
        }

        [HttpPost]
        public async Task<ActionResult<PetOwnerResponse>> Create([FromBody] CreatePetOwnerCommand command)
        {
            var result = await mediator.Send(command);
            return Ok(result);
        }

        [HttpPost("{ownerId:guid}/pets")]
        public async Task<ActionResult<PetOwnerResponse>> RegisterPetsToOwner(Guid ownerId, [FromBody] List<CreatePetCommand> commands)
        {

            var owner = mediator.Send(new GetPetOwnerCommand(ownerId));
            if (owner == null)
            {
                return NotFound();
            }

            var nulls = new List<CreatePetCommand>();
            foreach (var command in commands)
            {
                var result = await mediator.Send(command);
                if (result == null)
                {
                    nulls.Add(command);
                }
            }

            if (nulls.Count > 0)
            {
                return BadRequest(nulls);
            }

            var postPets = await mediator.Send(new RegisterPetsToOwnerQuery(ownerId, commands));
            return Ok(postPets);
        }
    }
}