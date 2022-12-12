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
    public class MedicalHistoryControllerTests : BaseIntegrationTests
    {
        private const string ApiURL = "v1/api/medicalHistory";

        public MedicalHistoryControllerTests(WebApplicationFactory<VetClinicsController> factory) : base(factory)
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

            // Act
            var response = await HttpClient.GetAsync(ApiURL);

            // Assert
            response.EnsureSuccessStatusCode();
            response.StatusCode.Should().Be(HttpStatusCode.OK);
        }

        [Fact]
        public async void When_PostMedHistoryWithValidData_Then_ShouldAddToDatabase()
        {
            var HttpClient = _factory.WithWebHostBuilder(builder =>
            {
                builder.ConfigureTestServices(services =>
                {
                    services.AddDbContext<DatabaseContext>(options =>
                    {
                        options.UseSqlite("Data Source = VetAppointmentTest24.db");
                    });
                });
            }).CreateClient(new WebApplicationFactoryClientOptions
            {
                AllowAutoRedirect = false,
            });
            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
                .UseSqlite("Data Source = VetAppointmentTest24.db").Options;
            DatabaseContext db = new DatabaseContext(options);
            db.RemoveRange(db.Drugs.ToList());
            db.SaveChanges();

            //Arrange
            var medHistorySut = CreateMedicalHistorySUT();
            var appointmentSut = CreateAppoinmentSUT();

            // Act
            var response = await HttpClient.PostAsJsonAsync(ApiURL + "/" + medHistorySut.Id, appointmentSut);

            // Assert
            response.EnsureSuccessStatusCode();
            response.StatusCode.Should().Be(HttpStatusCode.Created);
        }

        [Fact]
        public async void When_PostMedHistoryWithInvalidMedHistory_Then_ShouldReturnNotFound()
        {
            var HttpClient = _factory.WithWebHostBuilder(builder =>
            {
                builder.ConfigureTestServices(services =>
                {
                    services.AddDbContext<DatabaseContext>(options =>
                    {
                        options.UseSqlite("Data Source = VetAppointmentTest25.db");
                    });
                });
            }).CreateClient(new WebApplicationFactoryClientOptions
            {
                AllowAutoRedirect = false,
            });
            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
                .UseSqlite("Data Source = VetAppointmentTest25.db").Options;
            DatabaseContext db = new DatabaseContext(options);
            db.RemoveRange(db.Drugs.ToList());
            db.SaveChanges();

            //Arrange
            var appointmentSut = CreateAppoinmentSUT();

            // Act
            var response = await HttpClient.PostAsJsonAsync(ApiURL + "/30", appointmentSut);

            // Assert
            response.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_PostMedHistoryWithInvalidAppointment_Then_ShouldReturnNotFound()
        {
            var HttpClient = _factory.WithWebHostBuilder(builder =>
            {
                builder.ConfigureTestServices(services =>
                {
                    services.AddDbContext<DatabaseContext>(options =>
                    {
                        options.UseSqlite("Data Source = VetAppointmentTest26.db");
                    });
                });
            }).CreateClient(new WebApplicationFactoryClientOptions
            {
                AllowAutoRedirect = false,
            });
            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
                .UseSqlite("Data Source = VetAppointmentTest26.db").Options;
            DatabaseContext db = new DatabaseContext(options);
            db.RemoveRange(db.Drugs.ToList());
            db.SaveChanges();

            //Arrange
            var medHistorySut = CreateMedicalHistorySUT();
            var appointmentSut = new AppointmentDto
            {
                ScheduledDate = DateTime.Now.AddDays(1).ToString(),
                EstimatedDurationInMinutes = -10,
                VetId = CreateVetSUT().Id,
                PetId = CreatePetSUT().Id,
            };

            // Act
            var response = await HttpClient.PostAsJsonAsync(ApiURL + "/" + medHistorySut.Id, appointmentSut);

            // Assert
            response.StatusCode.Should().Be(HttpStatusCode.BadRequest);
        }

        [Fact]
        public async void When_PostMedHistoryWithInvalidPet_Then_ShouldReturnNotFound()
        {
            var HttpClient = _factory.WithWebHostBuilder(builder =>
            {
                builder.ConfigureTestServices(services =>
                {
                    services.AddDbContext<DatabaseContext>(options =>
                    {
                        options.UseSqlite("Data Source = VetAppointmentTest27.db");
                    });
                });
            }).CreateClient(new WebApplicationFactoryClientOptions
            {
                AllowAutoRedirect = false,
            });
            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
                .UseSqlite("Data Source = VetAppointmentTest27.db").Options;
            DatabaseContext db = new DatabaseContext(options);
            db.RemoveRange(db.Drugs.ToList());
            db.SaveChanges();

            //Arrange
            var medHistorySut = CreateMedicalHistorySUT();
            var appointmentSut = new AppointmentDto
            {
                ScheduledDate = DateTime.Now.AddDays(1).ToString(),
                EstimatedDurationInMinutes = 20,
                VetId = Guid.Empty,
                PetId = CreatePetSUT().Id,
            };

            // Act
            var response = await HttpClient.PostAsJsonAsync(ApiURL + "/" + medHistorySut.Id, appointmentSut);

            // Assert
            response.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_PostMedHistoryWithInvalidVet_Then_ShouldReturnNotFound()
        {
            var HttpClient = _factory.WithWebHostBuilder(builder =>
            {
                builder.ConfigureTestServices(services =>
                {
                    services.AddDbContext<DatabaseContext>(options =>
                    {
                        options.UseSqlite("Data Source = VetAppointmentTest28.db");
                    });
                });
            }).CreateClient(new WebApplicationFactoryClientOptions
            {
                AllowAutoRedirect = false,
            });
            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
                .UseSqlite("Data Source = VetAppointmentTest28.db").Options;
            DatabaseContext db = new DatabaseContext(options);
            db.RemoveRange(db.Drugs.ToList());
            db.SaveChanges();

            //Arrange
            var medHistorySut = CreateMedicalHistorySUT();
            var appointmentSut = new AppointmentDto
            {
                ScheduledDate = DateTime.Now.AddDays(1).ToString(),
                EstimatedDurationInMinutes = 20,
                VetId = CreateVetSUT().Id,
                PetId = Guid.Empty
            };

            // Act
            var response = await HttpClient.PostAsJsonAsync(ApiURL + "/" + medHistorySut.Id, appointmentSut);

            // Assert
            response.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }
        private static MedicalHistoryDto CreateMedicalHistorySUT()
        {
            return new MedicalHistoryDto
            {
                Id = Guid.NewGuid(),
                ClinicId = CreateClinicSUT().Id
            };
        }
        private static VetClinicDto CreateClinicSUT()
        {
            return new VetClinicDto
            {
                Id = Guid.NewGuid(),
                MedicalHistoryId = Guid.NewGuid(),
                RegistrationDate = DateTime.Now
            };
        }
        private static AppointmentDto CreateAppoinmentSUT()
        {
            return new AppointmentDto
            {
                ScheduledDate = DateTime.Now.AddDays(1).ToString(),
                EstimatedDurationInMinutes = 20,
                VetId = CreateVetSUT().Id,
                PetId = CreatePetSUT().Id,
            };
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
        private static VetDto CreateVetSUT()
        {
            return new VetDto
            {
                Name = "TestVet",
                Surname = "TestSurname",
                Birthdate = DateTime.Now.AddYears(-22).ToString(),
                Email = "test@email.com",
                Phone = "+40123456789",
                Gender = PersonGender.Male.ToString(),
                Specialisation = VetSpecialisation.DentalCaretaker.ToString()
            };
        }
    }
}
