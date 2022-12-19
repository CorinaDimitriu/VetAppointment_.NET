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

        [HttpPost]
        public IActionResult Create([FromBody] CreatePetOwnerDto petOwnerDto)
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

        [HttpPost ("{ownerId:guid}/pets")]
        public IActionResult RegisterPetsToOwner(Guid ownerId, [FromBody] List<CreatePetDto> petsDtos)
        {
            var owner = petOwnerRepository.Get(ownerId).Result;
            if (owner == null)
            {
                return NotFound();
            }

            var pets = petsDtos.Select(PetMapper.Mapper.Map<Pet>).ToList();
            if(pets.Any(p => p == null))
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
            return Created(nameof(Get), PetOwnerMapper.Mapper.Map<PetOwnerDto>(owner));
        }
    }
}
