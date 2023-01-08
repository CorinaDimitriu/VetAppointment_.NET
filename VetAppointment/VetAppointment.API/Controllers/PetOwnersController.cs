using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.API.Mappers;
using VetAppointment.Application;
using VetAppointment.Domain;
using VetAppointment.Infrastructure.Data;
using VetAppointment.Infrastructure.Repositories.GenericRepositories;

namespace VetAppointment.API.Controllers
{
    [Route("v{version:apiVersion}/api/[controller]")]
    [ApiController]
    [ApiVersion("1")]
    public class PetOwnersController : ControllerBase
    {
        private readonly IRepository<PetOwner> petOwnerRepository;
        private readonly IRepository<Pet> petRepository;

        public PetOwnersController(IRepository<PetOwner> petOwnerRepository, IRepository<Pet> petRepository)
        {
            this.petOwnerRepository = petOwnerRepository;
            this.petRepository = petRepository;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var petOwners = petOwnerRepository.All().Result.Select(PetOwnerMapper.Mapper.Map<PetOwnerDto>);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content - Type, x - requested - with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(petOwners);
        }

        [HttpGet("{ownerId:guid}")]
        public IActionResult GetById(Guid ownerId)
        {
            var owner = petOwnerRepository.Get(ownerId).Result;
            if (owner == null)
            {
                return NotFound();
            }

            var ownerDto = new PetOwnerDto
            {
                Id = owner.Id,
                Name = owner.Name,
                Surname = owner.Surname,
                Birthdate = owner.Birthdate.ToString(),
                Gender = owner.Gender.ToString(),
                Address = owner.Address,
                Email = owner.Email,
                Phone = owner.Phone,
            };

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(ownerDto);
        }

        [HttpPost]
        public IActionResult Post([FromBody] CreatePetOwnerDto petOwnerDto)
        {
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
        }

        [HttpPut("{ownerId:guid}")]
        public IActionResult Update(Guid ownerId, [FromBody] CreatePetOwnerDto ownerDto)
        {
            var owner = petOwnerRepository.Get(ownerId).Result;
            if (owner == null)
            {
                return NotFound();
            }

            var result = owner.Update(ownerDto.Name, ownerDto.Surname, ownerDto.Birthdate, ownerDto.Gender,
                ownerDto.Address, ownerDto.Email, ownerDto.Phone);
            if (result.IsFailure)
            {
                return BadRequest(result.Error);
            }

            petOwnerRepository.Update(result.Entity);
            petOwnerRepository.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content - Type, x - requested - with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return NoContent();
        }

        [HttpDelete("{ownerId:guid}")]
        public IActionResult Delete(Guid ownerId)
        {
            var owner = petOwnerRepository.Get(ownerId).Result;
            if (owner == null)
            {
                return NotFound();
            }

            var pets = petRepository.All().Result.Where(p => p.OwnerId == ownerId);
            if (pets != null)
            {
                foreach (var item in pets)
                {
                    petRepository.Delete(item);
                }
            }

            petOwnerRepository.Delete(owner);
            petOwnerRepository.SaveChanges();
            petRepository.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            Response.Headers.Add("Access-Control-Allow-Methods", "DELETE, GET, POST, OPTIONS, PUT");
            return NoContent();
        }

        [HttpGet("{ownerId:guid}/pets")]
        public IActionResult GetPetsByOwnerId(Guid ownerId)
        {
            var owner = petOwnerRepository.Get(ownerId).Result;
            if (owner == null)
            {
                return NotFound();
            }

            var pets = owner.Pets.Select(PetMapper.Mapper.Map<PetDto>);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(pets);
        }
    }
}
