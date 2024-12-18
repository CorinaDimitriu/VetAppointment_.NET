﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Dtos;
using VetAppointment.API.Mappers;
using VetAppointment.Application;
using VetAppointment.Domain;
using VetAppointment.Infrastructure.Repositories.GenericRepositories;

namespace VetAppointment.API.Controllers
{
    [Route("v{version:apiVersion}/api/[controller]")]
    [ApiController]
    [ApiVersion("1")]
    public class PetsController : ControllerBase
    {
        private readonly IRepository<Pet> petRepository;

        private void SetResponseHeader()
        {
            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
        }
        public PetsController(IRepository<Pet> petRepository) => this.petRepository = petRepository;

        [Authorize (Roles = "Admin_Vet")]
        [HttpGet]
        public IActionResult Get()
        {
            var pets = petRepository.All().Result.Select(PetMapper.Mapper.Map<PetDto>);

            SetResponseHeader();
            return Ok(pets);
        }

        [HttpGet("{petId:guid}")]
        public IActionResult GetById(Guid petId)
        {
            var pet = petRepository.Get(petId).Result;
            if (pet == null)
            {
                return NotFound();
            }

            var petDto = new PetDto
            {
                Id = pet.Id,
                OwnerId = pet.OwnerId,
                ClinicId = pet.ClinicId,
                Name = pet.Name,
                Birthdate = pet.Birthdate.ToString(),
                Race = pet.Race.ToString(),
                Gender = pet.Gender.ToString(),
            };

            SetResponseHeader();
            return Ok(petDto);
        }
    } 
}
