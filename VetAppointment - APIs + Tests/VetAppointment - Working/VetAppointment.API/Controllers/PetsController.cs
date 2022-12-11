using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Dtos;
using VetAppointment.Application;
using VetAppointment.Domain;

namespace VetAppointment.API.Controllers
{
    [Route("v1/api/[controller]")]
    [ApiController]
    public class PetsController : ControllerBase
    {
        private readonly IRepository<Pet> petRepository;

        public PetsController(IRepository<Pet> petRepository) => this.petRepository = petRepository;

        [HttpGet]
        public IActionResult Get()
        {
            var pets = petRepository
                .All()
                .Select(
                    p => new PetDto
                    {
                        Id= p.Id,
                        Name = p.Name,
                        Birthdate = p.Birthdate.ToString(),
                        Race = p.Race.ToString(),
                        Gender = p.Gender.ToString()
                    }
                );

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(pets);
        }
    } 
}
