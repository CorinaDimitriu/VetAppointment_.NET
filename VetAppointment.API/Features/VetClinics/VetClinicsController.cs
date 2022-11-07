using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Features.Pets;
using VetAppointment.API.Features.Vets;
using VetAppointment.Business;

namespace VetAppointment.API.Features.VetClinics
{
    [Route("api/[controller]")]
    [ApiController]
    public class VetClinicsController : ControllerBase
    {
        private readonly IVetClinicRepository repository;
        private readonly IPetRepository petRepository;
        private readonly IVetRepository vetRepository;

        public VetClinicsController(IVetClinicRepository repository, 
            IPetRepository petRepository, IVetRepository vetRepository)
        {
            this.repository = repository;
            this.petRepository = petRepository;
            this.vetRepository = vetRepository;
        }

        [HttpPost]

        public IActionResult Create([FromBody] CreateVetClinicDto vetClinicDto)
        {
            var vetClinic = VetClinic.Create(
                vetClinicDto.Name,
                vetClinicDto.Address,
                vetClinicDto.NumberOfPlaces,
                vetClinicDto.ContactEmail,
                vetClinicDto.ContactPhone
                );
            if (vetClinic.IsSuccess)
            {
                repository.Add(vetClinic.Entity);
                var fullClinic = new VetClinicDto
                {
                    Id = vetClinic.Entity.Id,
                    Name = vetClinic.Entity.Name,
                    Address = vetClinic.Entity.Address,
                    NumberOfPlaces = vetClinic.Entity.NumberOfPlaces,
                    ContactEmail = vetClinic.Entity.ContactEmail,
                    ContactPhone = vetClinic.Entity.ContactPhone,
                    RegistrationDate = vetClinic.Entity.RegistrationDate
                };

                return Created(nameof(GetAllVetClinics), fullClinic);
            }

            return BadRequest(vetClinic.Error);
        }

        [HttpGet]

        public IActionResult GetAllVetClinics()
        {
            var vetClinics = repository.GetAll().Select(vet => new VetClinicDto()
            {
                Id = vet.Id,
                Name = vet.Name,
                Address = vet.Address,
                NumberOfPlaces = vet.NumberOfPlaces,
                ContactEmail = vet.ContactEmail,
                ContactPhone = vet.ContactPhone,
                RegistrationDate = vet.RegistrationDate
            });
            return Ok(vetClinics);
        }

        [HttpPost("{shelterId:guid}/pets")]

        public IActionResult RegisterPetsFamily(Guid vetClinicId, [FromBody] List<PetDto> petsDtos)
        {
            var pets = petsDtos.Select(p => Pet.Create(p.Name, p.Age, p.Race, p.Gender)).ToList();
            if (pets.Any(p => p.IsFailure))
            {
                return BadRequest();
            }

            var clinic = repository.GetById(vetClinicId);
            if (clinic == null)
            {
                return NotFound();
            }
            var result = clinic.RegisterPetsFamilyToClinic(pets.Select(p => p.Entity).ToList());
            pets.ForEach(p => petRepository.Add(p.Entity));

            return result.IsSuccess ? NoContent() : BadRequest(result.Error);
        }

        [HttpPost("{shelterId:guid}/vet")]

        public IActionResult RegisterVet(Guid vetClinicId, [FromBody] VetDto vetDto)
        {
            var doctor = Vet.Create(vetDto.Name, vetDto.Surname, vetDto.Birthdate, 
                vetDto.Gender, vetDto.Email, vetDto.Phone);

            var clinic = repository.GetById(vetClinicId);
            if (clinic == null)
            {
                return NotFound();
            }
            var result = clinic.RegisterVetToClinic(doctor.Entity);
            vetRepository.Add(doctor.Entity);

            return result.IsSuccess ? NoContent() : BadRequest(result.Error);
        }

    }
}
