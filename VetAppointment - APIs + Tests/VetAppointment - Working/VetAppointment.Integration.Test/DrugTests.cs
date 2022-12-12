using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.AspNetCore.TestHost;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System.Net.Http.Json;
using VetAppointment.API.Controllers;
using VetAppointment.Domain;
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

        [Fact]
        public async void When_CreateDrugWithInValidData_Then_ShouldGetBadRequest()
        {
            var HttpClient = _factory.WithWebHostBuilder(builder =>
            {
                builder.ConfigureTestServices(services =>
                {
                    services.AddDbContext<DatabaseContext>(options =>
                    {
                        options.UseSqlite("Data Source = VetAppointmentTest11.db");
                    });
                });
            }).CreateClient(new WebApplicationFactoryClientOptions
            {
                AllowAutoRedirect = false,
            });
            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
                .UseSqlite("Data Source = VetAppointmentTest11.db").Options;
            DatabaseContext db = new DatabaseContext(options);
            db.RemoveRange(db.Drugs.ToList());
            db.SaveChanges();

            //Arrange
            var drugSUT = new DrugDto {
                Name = "Aspirina Saracului",
                Quantity = -2,
                UnitPrice = 0.1
            };

            // Act
            var createDrugResponse = await HttpClient.PostAsJsonAsync(ApiURL, drugSUT);

            // Assert
            createDrugResponse.StatusCode.Should().Be(HttpStatusCode.BadRequest);
        }

        [Fact]
        public async void When_DeleteDrugWithValidData_Then_ShouldDeleteFromDatabase()
        {
            var HttpClient = _factory.WithWebHostBuilder(builder =>
            {
                builder.ConfigureTestServices(services =>
                {
                    services.AddDbContext<DatabaseContext>(options =>
                    {
                        options.UseSqlite("Data Source = VetAppointmentTest12.db");
                    });
                });
            }).CreateClient(new WebApplicationFactoryClientOptions
            {
                AllowAutoRedirect = false,
            });
            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
                .UseSqlite("Data Source = VetAppointmentTest12.db").Options;
            DatabaseContext db = new DatabaseContext(options);
            db.RemoveRange(db.Drugs.ToList());
            db.SaveChanges();

            //Arrange
            var drugSUT = CreateDrugSUT();
            var createDrugResponse = await HttpClient.PostAsJsonAsync(ApiURL, drugSUT); 
            var getDrugResult = await HttpClient.GetAsync(ApiURL);

            // Act
            var getResult = await HttpClient.DeleteFromJsonAsync(ApiURL, drugSUT.GetType());
            var getResponse = await HttpClient.GetAsync(ApiURL);

            // Assert
            getResult.Should().Be(HttpStatusCode.OK);
        }

        [Fact]
        public async void When_DeleteDrugWithInvalidData_Then_ShouldReturnNotFound()
        {
            var HttpClient = _factory.WithWebHostBuilder(builder =>
            {
                builder.ConfigureTestServices(services =>
                {
                    services.AddDbContext<DatabaseContext>(options =>
                    {
                        options.UseSqlite("Data Source = VetAppointmentTest13.db");
                    });
                });
            }).CreateClient(new WebApplicationFactoryClientOptions
            {
                AllowAutoRedirect = false,
            });
            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
                .UseSqlite("Data Source = VetAppointmentTest13.db").Options;
            DatabaseContext db = new DatabaseContext(options);
            db.RemoveRange(db.Drugs.ToList());
            db.SaveChanges();

            //Arrange
            var getDrugResult = await HttpClient.GetAsync(ApiURL);
            var drugSUT = CreateDrugSUT();


            // Act
            var deleteResponse = await HttpClient.DeleteFromJsonAsync(getDrugResult.ToString(), drugSUT.GetType());

            // Assert
            deleteResponse.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_UpdateDrugWithValidData_Then_ShouldReturnOk()
        {
            var HttpClient = _factory.WithWebHostBuilder(builder =>
            {
                builder.ConfigureTestServices(services =>
                {
                    services.AddDbContext<DatabaseContext>(options =>
                    {
                        options.UseSqlite("Data Source = VetAppointmentTest14.db");
                    });
                });
            }).CreateClient(new WebApplicationFactoryClientOptions
            {
                AllowAutoRedirect = false,
            });
            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
                .UseSqlite("Data Source = VetAppointmentTest14.db").Options;
            DatabaseContext db = new DatabaseContext(options);
            db.RemoveRange(db.Drugs.ToList());
            db.SaveChanges();

            //Arrange
            var drugSUT = new DrugDto
            {
                Name = "Aspirina Saracului Nou",
                Quantity = 999,
                UnitPrice = 0.1
            };

            // Act
            var createDrugResponse = await HttpClient.PutAsJsonAsync(ApiURL, drugSUT);
            var getDrugResult = await HttpClient.GetAsync(ApiURL);

            // Assert
            createDrugResponse.EnsureSuccessStatusCode();
            createDrugResponse.StatusCode.Should().Be(HttpStatusCode.OK);
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
