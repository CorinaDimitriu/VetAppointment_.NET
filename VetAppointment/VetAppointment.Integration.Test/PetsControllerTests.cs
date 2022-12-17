using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.AspNetCore.TestHost;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using VetAppointment.API.Controllers;
using VetAppointment.Infrastructure.Data;
using VetAppointment.Integration.Tests;

namespace VetAppointment.Integration.Test
{
    public class PetsControllerTests : BaseIntegrationTests
    {
        private const string ApiURL = "v1/api/pets";

        private HttpClient GetHttpClient(string databaseName)
        {
            HttpClient httpClient = _factory.WithWebHostBuilder(builder =>
            {
                builder.ConfigureTestServices(services =>
                {
                    services.AddDbContext<DatabaseContext>(options =>
                    {
                        options.UseSqlite($"Data Source = {databaseName}.db");
                    });
                });
            }).CreateClient(new WebApplicationFactoryClientOptions
            {
                AllowAutoRedirect = false,
            });

            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
                .UseSqlite($"Data Source = {databaseName}.db").Options;
            DatabaseContext db = new(options);
            CleanDatabases(db);

            return httpClient;
        }
        
        public PetsControllerTests(WebApplicationFactory<VetClinicsController> factory) : base(factory) { }

        [Fact]
        public async void When_GetPets_Then_ShouldReturnPetsAndOk()
        {
            // Arrange
            var httpClient = GetHttpClient("When_GetPets_Then_ShouldReturnPetsAndOk");

            // Act
            var getPets = await httpClient.GetAsync(ApiURL);
            var pets = await getPets.Content.ReadFromJsonAsync<List<PetDto>>();

            // Assert
            getPets.StatusCode.Should().Be(HttpStatusCode.OK);
            pets.Should().NotBeNull();
        }
    }
}
