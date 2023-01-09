using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Dtos;
using VetAppointment.API.Mappers;
using VetAppointment.Application;
using VetAppointment.Domain;

namespace VetAppointment.API.Controllers
{
    [Route("v{version:apiVersion}/api/[controller]")]
    [ApiController]
    [ApiVersion("1")]
    public class VetsController : ControllerBase
    {
        private readonly IRepository<Vet> vetRepository;

        private void SetResponseHeader()
        {
            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
        }
        public VetsController(IRepository<Vet> vetRepository) => this.vetRepository = vetRepository;

        [HttpGet]
        public IActionResult Get()
        {
            var vets = vetRepository.All().Result.Select(VetMapper.Mapper.Map<VetDto>);

            SetResponseHeader();
            return Ok(vets);
        }

        [HttpGet("{vetId:guid}")]
        public IActionResult GetById(Guid vetId)
        {
            var vet = vetRepository.Get(vetId).Result;
            if (vet == null)
            {
                return NotFound();
            }

            var vetDto = new VetDto
            {
                Id = vet.Id,
                ClinicId = vet.ClinicId,
                Name = vet.Name,
                Surname = vet.Surname,
                Birthdate = vet.Birthdate.ToString(),
                Gender = vet.Gender.ToString(),
                Email = vet.Email,
                Phone = vet.Phone,
                Specialisation = vet.Specialisation.ToString()
            };

            SetResponseHeader();
            return Ok(vetDto);
        }
    }
}