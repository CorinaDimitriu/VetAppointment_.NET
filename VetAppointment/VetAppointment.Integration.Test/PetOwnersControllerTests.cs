#nullable disable
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.AspNetCore.TestHost;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using VetAppointment.API.Controllers;
using VetAppointment.Infrastructure.Data;

namespace VetAppointment.Integration.Tests
{
    public class PetOwnersControllerTests : BaseIntegrationTests
    {
        private const string ApiURL = "v1/api/petowners";

        public PetOwnersControllerTests(WebApplicationFactory<VetClinicsController> factory) : base(factory)
        {
        }

        [Fact]
        public async Task When_RegisterPetsToOwner_Then_ShouldSavePetsToOwnerAsync()
        {
            // Arrange
            var HttpClient = _factory.WithWebHostBuilder(builder =>
            {
                builder.ConfigureTestServices(services =>
                {
                    services.AddDbContext<DatabaseContext>(options =>
                    {
                        options.UseSqlite("Data Source = VetAppointmentTest9.db");
                    });
                });
            }).CreateClient(new WebApplicationFactoryClientOptions
            {
                AllowAutoRedirect = false,
            });
            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
                .UseSqlite("Data Source = VetAppointmentTest9.db").Options;
            DatabaseContext db = new DatabaseContext(options);
            CleanDatabases(db);
            //using (var scope = _factory.Services.CreateScope())
            //{
            //    var scopedServices = scope.ServiceProvider;
            //    var db = scopedServices.GetRequiredService<DatabaseContext>();

            //    db.RemoveRange(db.PetOwners.ToList());
            //    db.RemoveRange(db.VetClinics.ToList());
            //    db.RemoveRange(db.Pets.ToList());
            //    db.SaveChanges();
            //}

            CreatePetOwnerDto createPetOwnerDto = CreateSUT();
            var createPetOwnerResponse = await HttpClient.PostAsJsonAsync("v1/API/PetOwners", createPetOwnerDto);
            var pets = new List<PetDto>
            {
                new PetDto
                {
                    Name = "Bobita",
                    Birthdate = "9/10/2021",
                    Race = "Dog",
                    Gender = "Male"
                }
            };
            var petOwner = await createPetOwnerResponse.Content.ReadFromJsonAsync<PetOwnerDto>();

            // Act
            var resultResponse = await HttpClient.PostAsJsonAsync($"{ApiURL}/{petOwner.Id}/pets", pets);

            // Assert
            resultResponse.EnsureSuccessStatusCode();
            resultResponse.StatusCode.Should().Be(HttpStatusCode.Created);
        }

        [Fact]
        public async void When_RegisterEmptyListOfPetsToOwner_Then_ShouldReturnBadRequestAsync()
        {
            // Arrange
            var HttpClient = _factory.WithWebHostBuilder(builder =>
            {
                builder.ConfigureTestServices(services =>
                {
                    services.AddDbContext<DatabaseContext>(options =>
                    {
                        options.UseSqlite("Data Source = VetAppointmentTest8.db");
                    });
                });
            }).CreateClient(new WebApplicationFactoryClientOptions
            {
                AllowAutoRedirect = false,
            });
            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
                .UseSqlite("Data Source = VetAppointmentTest8.db").Options;
            DatabaseContext db = new DatabaseContext(options);
            CleanDatabases(db);
            
            CreatePetOwnerDto createPetOwnerDto = CreateSUT();

            var createPetOwnerResponse = await HttpClient.PostAsJsonAsync(ApiURL, createPetOwnerDto);
            var pets = new List<PetDto>();
            var petOwner = await createPetOwnerResponse.Content.ReadFromJsonAsync<PetOwnerDto>();

            // Act
            var resultResponse = await HttpClient.PostAsJsonAsync($"{ApiURL}/{petOwner.Id}/pets", pets);

            // Assert
            resultResponse.StatusCode.Should().Be(HttpStatusCode.BadRequest);
        }

        private static CreatePetOwnerDto CreateSUT()
        {
            return new CreatePetOwnerDto
            {
                Name = "Ion",
                Surname = "Ionescu",
                Birthdate = "19-10-1986",
                Gender = "Male",
                Address = "Iasi",
                Email = "ion@gmail.com",
                Phone = "+40732961298"
            };
        }
    }
}
