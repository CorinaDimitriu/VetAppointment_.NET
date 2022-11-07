using Microsoft.AspNetCore.Mvc;

namespace VetAppointment.API.Features.Pets
{
    [Route("api/[controller]")]
    [ApiController]
    public class PetsController : ControllerBase
    {
        private readonly IPetRepository repository;

        public PetsController (IPetRepository repository)
        {
            this.repository = repository;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var pets = repository.GetAll().Select
                (
                    p => new PetDto
                    {
                        Name = p.Name,
                        Age = p.Age,
                        Race = p.Race.ToString(),
                        Gender = p.Gender.ToString()
                    }
                );
            return Ok(pets);
        }
    } 
}
