﻿using Microsoft.AspNetCore.Mvc;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.Application;
using VetAppointment.Domain;

namespace VetAppointment.API.Controllers
{
    [Route("v1/api/[controller]")]
    [ApiController]
    public class DrugsController : ControllerBase
    {
        private readonly IRepository<Drug> drugRepository;

        public DrugsController(IRepository<Drug> drugRepository) => this.drugRepository = drugRepository;

        [HttpGet]
        public IActionResult Get()
        {
            var drugs = drugRepository.All().Select
                (
                    d => new DrugDto
                    {
                        Id = d.Id,
                        Name = d.Name,
                        Quantity = d.Quantity,
                        UnitPrice = d.UnitPrice
                    }
                );

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(drugs);
        }

        [HttpGet("{drugId:Guid}")]
        public IActionResult Get(Guid drugId)
        {
            {
                var drug = drugRepository.Get(drugId);

                if (drug == null)
                {
                    return NotFound();
                }

                var drugDto = new DrugDto
                {
                    Id = drug.Id,
                    Name = drug.Name,
                    Quantity = drug.Quantity,
                    UnitPrice = drug.UnitPrice
                };

                Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
                Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
                Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
                return Ok(drugDto);
            }
        }
        
        [HttpPost]
        public IActionResult Create([FromBody] CreateDrugDto drugDto)
        {
            var drug = Drug.Create(
                    drugDto.Name,
                    drugDto.Quantity,
                    drugDto.UnitPrice
                );

            if (drug.IsFailure)
            {
                return BadRequest(drug.Error);
            }

            drugRepository.Add(drug.Entity);
            drugRepository.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Created(nameof(Get), drug.Entity);
        }

        [HttpDelete("{drugId:Guid}")]
        public IActionResult Delete(Guid drugId)
        {
            var drug = drugRepository.Get(drugId);
            if (drug == null)
            {
                return NotFound();
            }
            
            drugRepository.Delete(drug);
            drugRepository.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok();
        }

        [HttpPut("{drugId:Guid}")]
        public IActionResult Update(Guid drugId, [FromBody] CreateDrugDto drugDto)
        {
            var drug = drugRepository.Get(drugId);
            if (drug == null)
            {
                return NotFound();
            }

            drug.Update(drugDto.Name, drugDto.Quantity, drugDto.UnitPrice);

            drugRepository.Update(drug);
            drugRepository.SaveChanges();

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Ok(drug);
        }
    }
}