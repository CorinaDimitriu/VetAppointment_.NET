using Microsoft.AspNetCore.Mvc;

namespace VetAppointment.API.Features.Vets
{
    [Route("api/[controller]")]
    [ApiController]
    public class VetsController : ControllerBase
    {
        private readonly IVetRepository repository;

        public VetsController(IVetRepository repository)
        {
            this.repository = repository;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var vets = repository.GetAll().Select
                (
                    v => new VetDto
                    {
                        Name = v.Name,
                        Surname = v.Surname,
                        Birthdate = v.Birthdate,
                        Gender = v.Gender.ToString(),
                        Email = v.Email,
                        Phone = v.Phone
                    }
                );
            return Ok(vets);
        }
    }
}