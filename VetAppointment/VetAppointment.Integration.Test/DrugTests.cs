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
    public class DrugTests : BaseIntegrationTests
    {

        private const string ApiURL = "v1/api/drugs";

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

        public DrugTests(WebApplicationFactory<VetClinicsController> factory) : base(factory) { }

        [Fact]
        public async Task When_GetDrugs_Then_SouldReturnDrugsAndOk()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("When_GetDrugs_Then_SouldReturnDrugsAndOk");

            // Act
            var response = await httpClient.GetAsync(ApiURL);
            var drugs = await response.Content.ReadFromJsonAsync<IEnumerable<DrugDto>>().ConfigureAwait(false);

            // Assert
            response.EnsureSuccessStatusCode();
            response.StatusCode.Should().Be(HttpStatusCode.OK);
            drugs.Should().NotBeNull();
        }

        [Fact]
        public async void When_GetDrugById_Then_SouldReturnDrug()
        {
            // Arrange
            var httpClient = GetHttpClient("When_GetDrugById_Then_SouldReturnDrug");
            var drudDto = CreateDrugSUT();

            var postDrug = await httpClient.PostAsJsonAsync(ApiURL, drudDto);
            var drug = postDrug.Content.ReadFromJsonAsync<DrugDto>().Result;

            // Act
            var respondeGet = await httpClient.GetAsync($"{ApiURL}/{drug.Id}");
            var getDrug = respondeGet.Content.ReadFromJsonAsync<DrugDto>();

            // Assert
            respondeGet.StatusCode.Should().Be(HttpStatusCode.OK);
            getDrug.Should().NotBeNull();
        }

        [Fact]
        public async void When_GetDrugByIdWithInvalidId_Then_SouldReturnNotFound()
        {
            // Arrange
            var httpClient = GetHttpClient("When_GetDrugByIdWithInvalidId_Then_SouldReturnNotFound");

            // Act
            var respondeGet = await httpClient.GetAsync($"{ApiURL}/{Guid.NewGuid()}");

            // Assert
            respondeGet.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_UpdateDrugWithValidData_Then_SouldReturnOkAndDrug()
        {
            // Arrange
            var httpClient = GetHttpClient("When_GetDrugById_Then_SouldReturnDrug");
            var drudDto = CreateDrugSUT();

            var postDrug = await httpClient.PostAsJsonAsync(ApiURL, drudDto);
            var drug = postDrug.Content.ReadFromJsonAsync<DrugDto>().Result;

            // Act

            drug.Name = "UpdatedName";

            var respondeGet = await httpClient.PutAsJsonAsync($"{ApiURL}/{drug.Id}", drug);
            var getDrug = respondeGet.Content.ReadFromJsonAsync<DrugDto>();

            // Assert
            respondeGet.StatusCode.Should().Be(HttpStatusCode.OK);
            getDrug.Should().NotBeNull();
        }

        [Fact]
        public async void When_UpdateDrugWithInvalidId_Then_SouldReturnOkAndDrug()
        {
            // Arrange
            var httpClient = GetHttpClient("When_UpdateDrugWithInvalidId_Then_SouldReturnNotFound");
            var drudDto = CreateDrugSUT();

            var postDrug = await httpClient.PostAsJsonAsync(ApiURL, drudDto);
            var drug = postDrug.Content.ReadFromJsonAsync<DrugDto>().Result;

            // Act

            drug.Name = "UpdatedName";

            var respondeGet = await httpClient.PutAsJsonAsync($"{ApiURL}/{Guid.NewGuid()}", drug);

            // Assert
            respondeGet.StatusCode.Should().Be(HttpStatusCode.NotFound);
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
    }
}