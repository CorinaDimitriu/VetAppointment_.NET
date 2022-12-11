using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.AspNetCore.TestHost;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using VetAppointment.API.Controllers;
using VetAppointment.Infrastructure.Data;
using VetAppointment.Integration.Tests;

namespace VetAppointment.Integration.Test
{
    public class DrugTests : BaseIntegrationTests
    {

        private const string ApiURL = "v1/api/drugs";

        public DrugTests(WebApplicationFactory<VetClinicsController> factory) : base(factory)
        {
        }

        [Fact]
        public async void When_CreateDrugWithValidData_Then_ShouldAddToDataBase()
        {
            var HttpClient = _factory.WithWebHostBuilder(builder =>
            {
                builder.ConfigureTestServices(services =>
                {
                    services.AddDbContext<DatabaseContext>(options =>
                    {
                        options.UseSqlite("Data Source = VetAppointmentTest10.db");
                    });
                });
            }).CreateClient(new WebApplicationFactoryClientOptions
            {
                AllowAutoRedirect = false,
            });
            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
                .UseSqlite("Data Source = VetAppointmentTest10.db").Options;
            DatabaseContext db = new DatabaseContext(options);
            db.RemoveRange(db.Drugs.ToList());
            db.SaveChanges();

            //Arrange
            var drugSUT = CreateDrugSUT();

            // Act
            var createDrugResponse = await HttpClient.PostAsJsonAsync(ApiURL, drugSUT);
            var getDrugResult = await HttpClient.GetAsync(ApiURL);

            // Assert
            createDrugResponse.EnsureSuccessStatusCode();
            createDrugResponse.StatusCode.Should().Be(HttpStatusCode.Created);

            getDrugResult.EnsureSuccessStatusCode();
            var clinics = await getDrugResult.Content.ReadFromJsonAsync<List<VetClinicDto>>();

            clinics.Should().HaveCount(1);
            clinics.Should().NotBeNull();
        }

        private static DrugDto CreateDrugSUT()
        {
            return new DrugDto
            {
                Name = "Aspirina Saracului",
                Quantity = 9999,
                UnitPrice = 0.1
            };
        }
    }
}
