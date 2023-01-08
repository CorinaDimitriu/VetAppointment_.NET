using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.AspNetCore.TestHost;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using VetAppointment.API.Controllers;
using VetAppointment.Infrastructure.Data;
using VetAppointment.Integration.Tests;

#nullable disable
namespace VetAppointment.Integration.Test
{
    public class PrescribedDrugsControllerTests : BaseIntegrationTests
    {
        private const string ApiURL = "v1/api/PrescribedDrugs";
        private const string ApiURL_drugs = "v1/api/drugs";

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

        public PrescribedDrugsControllerTests(WebApplicationFactory<VetClinicsController> factory) : base(factory) { }

        [Fact]
        public async void When_GetPrescribedDrugs_Then_ShouldReturnPrescribedDrugs()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("When_GetPrescribedDrugs_Then_ShouldReturnPrescribedDrugs");

            // Act
            var response = await httpClient.GetAsync(ApiURL);
            var prescribedDrugs = await response.Content.ReadFromJsonAsync<IEnumerable<PrescribedDrugDto>>();

            // Assert
            response.EnsureSuccessStatusCode();
            response.StatusCode.Should().Be(HttpStatusCode.OK);
            prescribedDrugs.Should().NotBeNull();
        }

        [Fact]
        public async void When_PostPrescribedDrugWithValidData_Then_ShouldReturnCreated()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("When_GetPrescribedDrugs_Then_ShouldReturnPrescribedDrugs");

            var drugSut = CreateDrugSUT();

            var postDrug = await httpClient.PostAsJsonAsync(ApiURL_drugs, drugSut);
            var drug = await postDrug.Content.ReadFromJsonAsync<DrugDto>();

            var prescribedDrugSut = CreatePrescribedDrugDtoSUT();
            prescribedDrugSut.DrugToPrescribeId = drug.Id;

            // Act
            var response = await httpClient.PostAsJsonAsync(ApiURL, prescribedDrugSut);
            var prescribedDrugs = await response.Content.ReadFromJsonAsync<PrescribedDrugDto>();

            // Assert
            response.EnsureSuccessStatusCode();
            response.StatusCode.Should().Be(HttpStatusCode.Created);
            prescribedDrugs.Should().NotBeNull();
        }

        [Fact]
        public async void When_PostPrescribedDrugWithInvalidDrugId_Then_ShouldReturnNotFound()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("When_GetPrescribedDrugs_Then_ShouldReturnPrescribedDrugs");
            
            var prescribedDrugSut = CreatePrescribedDrugDtoSUT();
            prescribedDrugSut.DrugToPrescribeId = Guid.NewGuid();

            // Act
            var response = await httpClient.PostAsJsonAsync(ApiURL, prescribedDrugSut);

            // Assert
            response.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        private static CreateDrugDto CreateDrugSUT()
        {
            return new CreateDrugDto
            {
                Name = "Aspirina Saracului",
                Quantity = 9999,
                UnitPrice = 0.1
            };
        }

        private static CreatePrescribedDrugDto CreatePrescribedDrugDtoSUT()
        {
            return new CreatePrescribedDrugDto
            {
                Quantity = 9999
            };
        }
    }
}
