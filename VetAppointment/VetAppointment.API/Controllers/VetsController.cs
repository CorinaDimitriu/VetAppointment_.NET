using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.API.Mappers;
using VetAppointment.Application;
using VetAppointment.Domain;

namespace VetAppointment.API.Controllers
{
    [Route("v1/api/[controller]")]
    [ApiController]
    public class VetsController : ControllerBase
    {
        private readonly IRepository<Vet> vetRepository;

        public VetsController(IRepository<Vet> vetRepository) => this.vetRepository = vetRepository;

        [HttpGet]
        public IActionResult Get()
        {
            var vets = vetRepository.All().Result.Select(VetMapper.Mapper.Map<VetDto>);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(vets);
        }
    }
}