using MediatR;
using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Mappers;
using VetAppointment.API.Validators;
using VetAppointment.Application;
using VetAppointment.Application.Commands;
using VetAppointment.Application.Queries;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.API.Controllers
{
    [Route("v1/api/[controller]")]
    [ApiController]
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
        public async Task<ActionResult<PetOwnerResponse>> RegisterPetsToOwner(Guid ownerId, [FromBody] List<CreatePetCommand> petsDtos)
        {
            var result = await mediator.Send(new RegisterPetsToOwnerQuery(ownerId, petsDtos));
            return Ok(result);
        }
    }
}