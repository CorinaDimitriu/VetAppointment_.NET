//using Microsoft.AspNetCore.TestHost;
//using Microsoft.EntityFrameworkCore;
//using Microsoft.Extensions.DependencyInjection;
//using VetAppointment.API.Controllers;
//using VetAppointment.Domain.Enums;
//using VetAppointment.Infrastructure.Data;

//namespace VetAppointment.Integration.Tests
//{
//    public class AppointmentsControllerTests : BaseIntegrationTests
//    {
//        private const string ApiURL = "v1/api/appointments";

//        public AppointmentsControllerTests(WebApplicationFactory<VetClinicsController> factory) : base(factory) { } 

//        [Fact]
//        public async Task When_CreateAppointment_Then_ShouldReturnAppointmentInTheGetRequestAsync()
//        {
//            var HttpClient = _factory.WithWebHostBuilder(builder =>
//            {
//                builder.ConfigureTestServices(services =>
//                {
//                    services.AddDbContext<DatabaseContext>(options =>
//                    {
//                        options.UseSqlite("Data Source = VetAppointmentTest15.db");
//                    });
//                });
//            }).CreateClient(new WebApplicationFactoryClientOptions
//            {
//                AllowAutoRedirect = false,
//            });
//            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
//                .UseSqlite("Data Source = VetAppointmentTest15.db").Options;
//            DatabaseContext db = new DatabaseContext(options);
//            db.RemoveRange(db.Drugs.ToList());
//            db.SaveChanges();

//            // Arrange
//            var pet = CreatePetSUT();
//            var vet = CreateVetSUT();
//            var postPet = await HttpClient.PostAsJsonAsync(ApiURL, pet);
//            AppointmentDto appointmentDto = CreateAppoinmentSUT();

//            // Act
//            var createAppointmentResponse = await HttpClient.PostAsJsonAsync(ApiURL, appointmentDto);
//            var getAppointmentResult = await HttpClient.GetAsync(ApiURL);

//            // Assert
//            createAppointmentResponse.EnsureSuccessStatusCode();
//            createAppointmentResponse.StatusCode.Should().Be(HttpStatusCode.Created);

//            getAppointmentResult.EnsureSuccessStatusCode();
//            var appointments = await getAppointmentResult.Content.ReadFromJsonAsync<List<AppointmentDto>>();
//            appointments.Should().HaveCount(1);
//            appointments.Should().NotBeNull();
//        }

//        [Fact]
//        public async Task When_GetAllAppointments_Then_ShouldReturnAppointmentsAsync()
//        {
//            var HttpClient = _factory.WithWebHostBuilder(builder =>
//            {
//                builder.ConfigureTestServices(services =>
//                {
//                    services.AddDbContext<DatabaseContext>(options =>
//                    {
//                        options.UseSqlite("Data Source = VetAppointmentTest16.db");
//                    });
//                });
//            }).CreateClient(new WebApplicationFactoryClientOptions
//            {
//                AllowAutoRedirect = false,
//            });
//            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
//                .UseSqlite("Data Source = VetAppointmentTest16.db").Options;
//            DatabaseContext db = new DatabaseContext(options);
//            db.RemoveRange(db.Drugs.ToList());
//            db.SaveChanges();

//            // Arrange
//            AppointmentDto appointmentDto = CreateAppoinmentSUT();
//            var createAppointmentResponse = await HttpClient.PostAsJsonAsync(ApiURL, appointmentDto);
//            var getAppointmentResult = await HttpClient.GetAsync(ApiURL);

//            // Act
//            var appointmentsResponse = await HttpClient.GetAsync(ApiURL);

//            // Assert
//            appointmentsResponse.EnsureSuccessStatusCode();
//            appointmentsResponse.Should().NotBeNull();
//            appointmentsResponse.StatusCode.Should().Be(HttpStatusCode.OK);
//        }

//        [Fact]
//        public async Task When_GetAppointmentById_Then_ShouldReturnAppointment()
//        {
//            var HttpClient = _factory.WithWebHostBuilder(builder =>
//            {
//                builder.ConfigureTestServices(services =>
//                {
//                    services.AddDbContext<DatabaseContext>(options =>
//                    {
//                        options.UseSqlite("Data Source = VetAppointmentTest17.db");
//                    });
//                });
//            }).CreateClient(new WebApplicationFactoryClientOptions
//            {
//                AllowAutoRedirect = false,
//            });
//            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
//                .UseSqlite("Data Source = VetAppointmentTest17.db").Options;
//            DatabaseContext db = new DatabaseContext(options);
//            db.RemoveRange(db.Drugs.ToList());
//            db.SaveChanges();

//            // Arrange
//            AppointmentDto appointmentDto = CreateAppoinmentSUT();
//            var createAppointmentResponse = await HttpClient.PostAsJsonAsync(ApiURL, appointmentDto);
//            var getAppointmentResult = await HttpClient.GetAsync(ApiURL);

//            // Act
//            var appointmentsResponse = await HttpClient.GetAsync(ApiURL + "/" + appointmentDto.Id);

//            // Assert
//            appointmentsResponse.EnsureSuccessStatusCode();
//            appointmentsResponse.Should().NotBeNull();
//            appointmentsResponse.StatusCode.Should().Be(HttpStatusCode.OK);
//        }

//        [Fact]
//        public async Task When_GetInvalidAppointmentById_Then_ShouldReturnNotFound()
//        {
//            var HttpClient = _factory.WithWebHostBuilder(builder =>
//            {
//                builder.ConfigureTestServices(services =>
//                {
//                    services.AddDbContext<DatabaseContext>(options =>
//                    {
//                        options.UseSqlite("Data Source = VetAppointmentTest18.db");
//                    });
//                });
//            }).CreateClient(new WebApplicationFactoryClientOptions
//            {
//                AllowAutoRedirect = false,
//            });
//            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
//                .UseSqlite("Data Source = VetAppointmentTest18.db").Options;
//            DatabaseContext db = new DatabaseContext(options);
//            db.RemoveRange(db.Drugs.ToList());
//            db.SaveChanges();

//            // Arrange

//            // Act
//            var appointmentsResponse = await HttpClient.GetAsync(ApiURL + "/" + 30);

//            // Assert
//            appointmentsResponse.StatusCode.Should().Be(HttpStatusCode.NotFound);
//        }

//        [Fact]
//        public async Task When_DeleteAppointmentById_Then_ShouldReturnNoContent()
//        {
//            var HttpClient = _factory.WithWebHostBuilder(builder =>
//            {
//                builder.ConfigureTestServices(services =>
//                {
//                    services.AddDbContext<DatabaseContext>(options =>
//                    {
//                        options.UseSqlite("Data Source = VetAppointmentTest19.db");
//                    });
//                });
//            }).CreateClient(new WebApplicationFactoryClientOptions
//            {
//                AllowAutoRedirect = false,
//            });
//            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
//                .UseSqlite("Data Source = VetAppointmentTest19.db").Options;
//            DatabaseContext db = new DatabaseContext(options);
//            db.RemoveRange(db.Drugs.ToList());
//            db.SaveChanges();

//            // Arrange
//            AppointmentDto appointmentDto = CreateAppoinmentSUT();
//            var createAppointmentResponse = await HttpClient.PostAsJsonAsync(ApiURL, appointmentDto);
//            var getAppointmentResult = await HttpClient.GetAsync(ApiURL);

//            // Act
//            var deleteResponse = await HttpClient.DeleteFromJsonAsync(ApiURL + "/" + appointmentDto.Id, appointmentDto.GetType());

//            // Assert
//            deleteResponse.Should().Be(HttpStatusCode.NoContent);
//        }

//        [Fact]
//        public async Task When_DeleteAppointmentByInvalidId_Then_ShouldReturnNotFound()
//        {
//            var HttpClient = _factory.WithWebHostBuilder(builder =>
//            {
//                builder.ConfigureTestServices(services =>
//                {
//                    services.AddDbContext<DatabaseContext>(options =>
//                    {
//                        options.UseSqlite("Data Source = VetAppointmentTest20.db");
//                    });
//                });
//            }).CreateClient(new WebApplicationFactoryClientOptions
//            {
//                AllowAutoRedirect = false,
//            });
//            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
//                .UseSqlite("Data Source = VetAppointmentTest20.db").Options;
//            DatabaseContext db = new DatabaseContext(options);
//            db.RemoveRange(db.Drugs.ToList());
//            db.SaveChanges();

//            // Arrange
//            AppointmentDto appointmentDto = CreateAppoinmentSUT();

//            // Act
//            var deleteResponse = await HttpClient.DeleteFromJsonAsync(ApiURL + "/30", appointmentDto.GetType());

//            // Assert
//            deleteResponse.Should().Be(HttpStatusCode.NoContent);
//        }

//        [Fact]
//        public async Task When_UpdateAppointmentWithId_Then_ShouldReturnNoContent()
//        {
//            var HttpClient = _factory.WithWebHostBuilder(builder =>
//            {
//                builder.ConfigureTestServices(services =>
//                {
//                    services.AddDbContext<DatabaseContext>(options =>
//                    {
//                        options.UseSqlite("Data Source = VetAppointmentTest21.db");
//                    });
//                });
//            }).CreateClient(new WebApplicationFactoryClientOptions
//            {
//                AllowAutoRedirect = false,
//            });
//            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
//                .UseSqlite("Data Source = VetAppointmentTest21.db").Options;
//            DatabaseContext db = new DatabaseContext(options);
//            db.RemoveRange(db.Drugs.ToList());
//            db.SaveChanges();

//            // Arrange
//            AppointmentDto appointmentDto = CreateAppoinmentSUT();
//            var createAppointmentResponse = await HttpClient.PostAsJsonAsync(ApiURL, appointmentDto);
//            var getAppointmentResult = await HttpClient.GetAsync(ApiURL);

//            // Act
//            var updateResponse = await HttpClient.PutAsJsonAsync(ApiURL + "/" + appointmentDto.Id, appointmentDto.GetType());

//            // Assert
//            updateResponse.EnsureSuccessStatusCode();
//            updateResponse.StatusCode.Should().Be(HttpStatusCode.NoContent);
//        }

//        [Fact]
//        public async Task When_UpdateAppointmentWithInvalidId_Then_ShouldReturnNotFound()
//        {
//            var HttpClient = _factory.WithWebHostBuilder(builder =>
//            {
//                builder.ConfigureTestServices(services =>
//                {
//                    services.AddDbContext<DatabaseContext>(options =>
//                    {
//                        options.UseSqlite("Data Source = VetAppointmentTest22.db");
//                    });
//                });
//            }).CreateClient(new WebApplicationFactoryClientOptions
//            {
//                AllowAutoRedirect = false,
//            });
//            DbContextOptions<DatabaseContext> options = new DbContextOptionsBuilder<DatabaseContext>()
//                .UseSqlite("Data Source = VetAppointmentTest22.db").Options;
//            DatabaseContext db = new DatabaseContext(options);
//            db.RemoveRange(db.Drugs.ToList());
//            db.SaveChanges();

//            // Arrange
//            AppointmentDto appointmentDto = CreateAppoinmentSUT();

//            // Act
//            var updateResponse = await HttpClient.PutAsJsonAsync(ApiURL + "/30", appointmentDto.GetType());

//            // Assert
//            updateResponse.StatusCode.Should().Be(HttpStatusCode.NotFound);
//        }

//        private static AppointmentDto CreateAppoinmentSUT()
//        {
//            return new AppointmentDto
//            {
//                ScheduledDate = DateTime.Now.AddDays(1).ToString(),
//                EstimatedDurationInMinutes = 20,
//                VetId = CreateVetSUT().Id,
//                PetId = CreatePetSUT().Id,
//            };
//        }

//        private static PetDto CreatePetSUT()
//        {
//            return new PetDto
//            {
//                Name = "TestPet",
//                Birthdate = DateTime.Now.AddYears(-1).ToString(),
//                Gender = AnimalGender.Male.ToString(),
//                Race = AnimalRace.Cat.ToString()
//            };
//        }

//        private static VetDto CreateVetSUT()
//        {
//            return new VetDto
//            {
//                Name = "TestVet",
//                Surname = "TestSurname",
//                Birthdate = DateTime.Now.AddYears(-22).ToString(),
//                Email = "test@email.com",
//                Phone = "+40123456789",
//                Gender = PersonGender.Male.ToString(),
//                Specialisation = VetSpecialisation.DentalCaretaker.ToString()
//            };
//        }


//    }
//}