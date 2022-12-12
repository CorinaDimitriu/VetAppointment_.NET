using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.AspNetCore.TestHost;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VetAppointment.API.Controllers;
using VetAppointment.Domain.Enums;
using VetAppointment.Infrastructure.Data;
using VetAppointment.Integration.Tests;

namespace VetAppointment.Integration.Test
{
    public class PetControllerTests : BaseIntegrationTests
    {
        private const string ApiURL = "v1/api/pets";

        public PetControllerTests(WebApplicationFactory<VetClinicsController> factory) : base(factory)
        {
        }

        [Fact]
        public async void When_GetPet_Then_ShouldReturnOk()
        {
            var HttpClient = _factory.WithWebHostBuilder(builder =>
            {
                builder.ConfigureTestServices(services =>
                {
                    services.AddDbContext<DatabaseContext>(options =>
                    {
                        options.UseSqlite("Data Source = VetAppointmentTest29.db");
                    });
                });
            }).CreateClient(new WebApplicationFactoryClientOptions
            {
                AllowAutoRedirect = false,
            });
            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
                .UseSqlite("Data Source = VetAppointmentTest29.db").Options;
            DatabaseContext db = new DatabaseContext(options);
            db.RemoveRange(db.Drugs.ToList());
            db.SaveChanges();

            //Arrange
            var petSUT = CreatePetSUT();

            // Act
            var response = await HttpClient.GetFromJsonAsync(ApiURL, petSUT.GetType());

            // Assert
            response.Should().Be(HttpStatusCode.OK);
        }

        private static PetDto CreatePetSUT()
        {
            return new PetDto
            {
                Name = "TestPet",
                Birthdate = DateTime.Now.AddYears(-1).ToString(),
                Gender = AnimalGender.Male.ToString(),
                Race = AnimalRace.Cat.ToString()
            };
        }

    }
}
