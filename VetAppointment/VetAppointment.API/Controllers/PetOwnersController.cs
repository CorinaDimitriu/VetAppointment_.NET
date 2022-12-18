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
        private readonly CreatePetOwnerDtoValidator createPetOwnerDtoValidator = new();
        private readonly CreatePetDtoValidator createPetDtoValidator = new();

        public PetOwnersController(IMediator medediator)
        {
            this.mediator= medediator;
        }

        [HttpGet]
        public async Task<List<PetOwnerResponse>> Get()
        {
            return await mediator.Send(new GetAllPetOwnersQuery());
            /*var petOwners = petOwnerRepository.All().Result.Select(PetOwnerMapper.Mapper.Map<PetOwnerDto>);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content - Type, x - requested - with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(petOwners);*/
        }

        [HttpPost]
        public async Task<ActionResult<PetOwnerResponse>> Create([FromBody] CreatePetOwnerCommand command)
        {
            var result = await mediator.Send(command);
            return Ok(result);
            /*var validatorResult = createPetOwnerDtoValidator.Validate(petOwnerDto);
            if (!validatorResult.IsValid)
            {
                return BadRequest(validatorResult.Errors);
            }
            var petOwner = PetOwnerMapper.Mapper.Map<PetOwner>(petOwnerDto);

            if (petOwner == null)
            {
                return BadRequest();
            }

            petOwnerRepository.Add(petOwner);
            petOwnerRepository.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content - Type, x - requested - with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Created(nameof(Get), PetOwnerMapper.Mapper.Map<PetOwnerDto>(petOwner));
            */
        }

        [HttpPost("{ownerId:guid}/pets")]
        public async Task<ActionResult<PetOwnerResponse>> RegisterPetsToOwner(Guid ownerId, [FromBody] List<CreatePetCommand> petsDtos)
        {
            var result = await mediator.Send(new RegisterPetsToOwnerQuery(ownerId, petsDtos));
            return Ok(result);
            /*var owner = petOwnerRepository.Get(ownerId).Result;
            if (owner == null)
            {
                return NotFound();
            }

            foreach (var petDto in petsDtos)
            {
                var validatorResult = createPetDtoValidator.Validate(petDto);
                if (!validatorResult.IsValid)
                {
                    return BadRequest(validatorResult.Errors);
                }
            }

            var pets = petsDtos.Select(PetMapper.Mapper.Map<Pet>).ToList();
            if (pets.Any(p => p == null))
            {
                return BadRequest();
            }

            var result = owner.RegisterPetsToOwner(pets);

            if (result.IsFailure)
            {
                return BadRequest(result.Error);
            }

            pets.ForEach(p => petRepository.Add(p));
            petOwnerRepository.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Created(nameof(Get), PetOwnerMapper.Mapper.Map<PetOwnerDto>(owner));*/
        }
    }
}