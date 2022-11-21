using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Dtos;
using VetAppointment.Application.Repositories;
using VetAppointment.Domain.Models;

namespace VetAppointment.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PetOwnersController : ControllerBase
    {
        private readonly IPetOwnerRepository repository;
        private readonly IPetRepository petRepository;

        public PetOwnersController(IPetOwnerRepository repository, IPetRepository petRepository)
        {
            this.repository = repository;
            this.petRepository = petRepository;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var petOwners = repository.GetAll().Select(owner => new PetOwnerDto
            {
                Id = owner.Id,
                Name = owner.Name,
                Surname = owner.Surname,
                Birthdate = owner.Birthdate,
                Gender = owner.Gender.ToString(),
                Address = owner.Address,
                Email = owner.Email,
                Phone = owner.Phone
            });
            return Ok(petOwners);
        }

        [HttpPost("{shelterId:guid}/pets")]

        public IActionResult RegisterPetsToOwner(Guid ownerId, [FromBody] List<PetDto> petsDtos)
        {
            var pets = petsDtos.Select(p => Pet.Create(p.Name, p.Age, p.Race, p.Gender)).ToList();
            if (pets.Any(p => p.IsFailure))
            {
                return BadRequest();
            }
            var owner = repository.GetById(ownerId);
            if (owner == null)
            {
                return NotFound();
            }

            var result = owner.RegisterPetsToOwner(pets.Select(p => p.Entity).ToList());
            pets.ForEach(p => petRepository.Add(p.Entity));

            return result.IsSuccess ? NoContent() : BadRequest(result.Error);
        }

    }
}
