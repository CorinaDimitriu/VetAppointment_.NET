using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.AspNetCore.TestHost;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using VetAppointment.API.Controllers;
using VetAppointment.Infrastructure.Data;
using VetAppointment.Integration.Tests;

namespace VetAppointment.Integration.Test
{
    public class PrescribedDrugsControllerTests : BaseIntegrationTests
    {
        private const string ApiURL = "v1/api/prescribedDrugs";

        public PrescribedDrugsControllerTests(WebApplicationFactory<VetClinicsController> factory) : base(factory)
        {
        }

        [Fact]
        public async void When_GetMedHistory_Then_ShouldReturnOk()
        {
            var HttpClient = _factory.WithWebHostBuilder(builder =>
            {
                builder.ConfigureTestServices(services =>
                {
                    services.AddDbContext<DatabaseContext>(options =>
                    {
                        options.UseSqlite("Data Source = VetAppointmentTest23.db");
                    });
                });
            }).CreateClient(new WebApplicationFactoryClientOptions
            {
                AllowAutoRedirect = false,
            });
            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
                .UseSqlite("Data Source = VetAppointmentTest23.db").Options;
            DatabaseContext db = new DatabaseContext(options);
            db.RemoveRange(db.Drugs.ToList());
            db.SaveChanges();

            //Arrange
            var prescribedDrugSUT = CreatePrescribedDrugSUT();

            // Act
            var response = await HttpClient.GetFromJsonAsync(ApiURL, prescribedDrugSUT.GetType());

            // Assert
            response.Should().Be(HttpStatusCode.OK);
        }
        private PrescribedDrugDto CreatePrescribedDrugSUT()
        {
            return new PrescribedDrugDto
            {
                Id = Guid.NewGuid()
            };
        }
    }
}
