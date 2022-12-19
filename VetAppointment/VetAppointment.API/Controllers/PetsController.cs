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
    public class PetsController : ControllerBase
    {
        private readonly IRepository<Pet> petRepository;

        public PetsController(IRepository<Pet> petRepository) => this.petRepository = petRepository;

        [HttpGet]
        public IActionResult Get()
        {
            var pets = petRepository.All().Result.Select(PetMapper.Mapper.Map<PetDto>);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(pets);
        }
    } 
}
