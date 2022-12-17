using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.AspNetCore.TestHost;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using VetAppointment.API.Controllers;
using VetAppointment.Domain.Enums;
using VetAppointment.Infrastructure.Data;
using VetAppointment.Integration.Tests;

namespace VetAppointment.Integration.Test
{
    public class VetsControllerTests : BaseIntegrationTests
    {
        private const string ApiURL = "v1/api/vets";

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

        public VetsControllerTests(WebApplicationFactory<VetClinicsController> factory) : base(factory) { }

        [Fact]
        public async void When_GetVets_Then_ShouldReturnAllVets()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("When_GetVets_Then_ShouldReturnAllVets");

            // Act
            var response = await httpClient.GetAsync(ApiURL);
            var vets = await response.Content.ReadFromJsonAsync<IEnumerable<VetDto>>();

            // Assert
            response.EnsureSuccessStatusCode();
            response.StatusCode.Should().Be(HttpStatusCode.OK);
            vets.Should().NotBeNull();
        }

        private static VetDto CreateVetSUT()
        {
            return new VetDto()
            {
                Name = "Maria",
                Surname = "Popovici",
                Birthdate = DateTime.Now.AddYears(-32).ToString(),
                Email = "maria.popovici@gmail.com",
                Phone = "+40123456789",
                Gender = PersonGender.Female.ToString(),
                Specialisation = VetSpecialisation.Nutritionist.ToString()
            };
        }
    }
}
