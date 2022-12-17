#nullable disable
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.AspNetCore.TestHost;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using VetAppointment.API.Controllers;
using VetAppointment.Domain.Enums;
using VetAppointment.Infrastructure.Data;

namespace VetAppointment.Integration.Tests
{
    public class VetClinicsControllerTests : BaseIntegrationTests
    {
        private const string ApiURL = "v1/api/vetclinics";

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

        public VetClinicsControllerTests(WebApplicationFactory<VetClinicsController> factory) : base(factory) { }

        [Fact]
        public async void When_GetVetsFromClinic_Then_ShouldRetrunVets()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("When_GetVetsFromClinic_Then_ShouldRetrunVets");

            var createVetClinicDto = CreateClinitSUT();
            var vetDto = CreateVetSUT();
            
            var createClinicResult = await httpClient.PostAsJsonAsync(ApiURL, createVetClinicDto);
            var clinic = createClinicResult.Content.ReadFromJsonAsync<VetClinicDto>().Result;

            var addVetToClinicResult = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/vet", vetDto);
            var vet = addVetToClinicResult.Content.ReadFromJsonAsync<VetDto>().Result;

            var vets = new List<VetDto> { vet };

            // Act

            var getVetsFromClinicResult = await httpClient.GetAsync($"{ApiURL}/{clinic.Id}/vets");
            var vetsGet = getVetsFromClinicResult.Content.ReadFromJsonAsync<List<VetDto>>().Result;

            var vetGet = vetsGet.First();

            var result = vetsGet.Count == vets.Count && vetGet.Id == vet.Id && vetGet.Name == vet.Name && vetGet.Surname == vet.Surname
                && vetGet.Specialisation == vet.Specialisation && vetGet.ClinicId == vet.ClinicId && vetGet.Gender == vet.Gender;

            // Assert

            Assert.True(result);
        }

        [Fact]
        public async void When_UpdateClinic_Then_ShouldReturnNoContent()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("When_UpdateClinic_Then_ShouldReturnNoContent");

            var createVetClinicDto = CreateClinitSUT();
            var createClinicResult = await httpClient.PostAsJsonAsync(ApiURL, createVetClinicDto);
            var clinic = createClinicResult.Content.ReadFromJsonAsync<VetClinicDto>().Result;

            var newName = "NewName";
            clinic.Name = newName;

            // Act
            var updateClinicResult = await httpClient.PutAsJsonAsync($"{ApiURL}/{clinic.Id}", clinic);

            // Assert
            updateClinicResult.StatusCode.Should().Be(HttpStatusCode.NoContent);
        }

        [Fact]
        public async void When_UpdateInvalidClinic_Then_ShouldReturnNotFound()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("When_UpdateClinic_Then_ShouldReturnNoContent");

            var clinic = CreateClinitSUT();

            // Act
            var updateClinicResult = await httpClient.PutAsJsonAsync($"{ApiURL}/{Guid.NewGuid()}", clinic);

            // Assert
            updateClinicResult.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_UpdateClinicWithInvalidData_Then_ShouldReturnBadRequest()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("When_UpdateClinic_Then_ShouldReturnNoContent");

            var createVetClinicDto = CreateClinitSUT();
            var createClinicResult = await httpClient.PostAsJsonAsync(ApiURL, createVetClinicDto);
            var clinic = createClinicResult.Content.ReadFromJsonAsync<VetClinicDto>().Result;

            var newEmail = "badMail";
            clinic.ContactEmail = newEmail;

            // Act
            var updateClinicResult = await httpClient.PutAsJsonAsync($"{ApiURL}/{clinic.Id}", clinic);

            // Assert
            updateClinicResult.StatusCode.Should().Be(HttpStatusCode.BadRequest);
        }

        [Fact]
        public async void When_GetVetsFromInvalidClinic_Then_ShouldRetrunVets()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("When_GetVetsFromInvalidClinic_Then_ShouldRetrunVets");

            // Act

            var getVetsFromClinicResult = await httpClient.GetAsync($"{ApiURL}/{Guid.NewGuid()}/vets");
            // Assert

            getVetsFromClinicResult.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_CreateClinic_Then_ShouldReturnClinicInTheGetRequestAsync()
        {
            // Arrange

            HttpClient httpClient = GetHttpClient("VetAppointmentTest7");

            CreateVetClinicDto vetClinicDto = CreateClinitSUT();

            // Act
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, vetClinicDto);
            var getClinicResult = await httpClient.GetAsync(ApiURL);

            // Assert
            createClinicResponse.EnsureSuccessStatusCode();
            createClinicResponse.StatusCode.Should().Be(HttpStatusCode.Created);

            getClinicResult.EnsureSuccessStatusCode();
            var clinics = await getClinicResult.Content.ReadFromJsonAsync<List<VetClinicDto>>();

            clinics.Should().HaveCount(1);
            clinics.Should().NotBeNull();
        }

        [Fact]
        public async Task When_RegisterPetsFamilyToClinic_Then_ShouldSavePetsInClinicAsync()
        {
            //Arrange
            HttpClient httpClient = GetHttpClient("VetAppointmentTest6");

            var createVetClinicDto = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, createVetClinicDto);
            var pets = new List<PetDto> { CreatePetSUT() };
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            // Act
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/pets", pets);

            // Assert
            //resultResponse();
            resultResponse.StatusCode.Should().Be(HttpStatusCode.Created);
        }

        [Fact]
        public async Task When_RegisterPetsFamilyToNullClinic_Then_ShouldReturnNotFound()
        {
            //Arrange
            HttpClient httpClient = GetHttpClient("VetAppointmentTest6");

            var pets = new List<PetDto> { CreatePetSUT() };

            // Act
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{Guid.NewGuid()}/pets", pets);

            // Assert
            //resultResponse();
            resultResponse.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_RegisterEmptyListOfPetsToClinic_Then_ShouldReturnBadRequestAsync()
        {
            //Arrange
            HttpClient httpClient = GetHttpClient("VetAppointmentTest5");

            CreateVetClinicDto createVetClinicDto = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, createVetClinicDto);
            var pets = new List<PetDto>();
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            // Act
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/pets", pets);

            // Assert
            resultResponse.StatusCode.Should().Be(System.Net.HttpStatusCode.BadRequest);
        }

        [Fact]
        public async void When_RegisterAppoientmentToClinic_Then_ShouldReturnAppointment()
        {
            //Arrange
            HttpClient httpClient = GetHttpClient("VetAppointmentTest8");
            
            CreateVetClinicDto createVetClinicDto = CreateClinitSUT();
            CreateAppointmentDto appointment = CreateAppointmentSUT();
            VetDto vetDto = CreateVetSUT();
            PetDto petDto = CreatePetSUT();

            
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, createVetClinicDto);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            var vetResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/vet", vetDto);
            var vet = await vetResponse.Content.ReadFromJsonAsync<VetDto>();

            var petResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/pets", new List<PetDto> { petDto });
            var pet = await petResponse.Content.ReadFromJsonAsync<List<PetDto>>();

            appointment.VetId = vet.Id;
            appointment.PetId = pet.First().Id;
            appointment.MedicalHistoryId = Guid.NewGuid();
            appointment.TreatmentId = Guid.NewGuid();

            // Act
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/appointment", appointment);

            // Assert
            resultResponse.StatusCode.Should().Be(HttpStatusCode.Created);
        }

        [Fact]
        public async void When_RegisterAppoientmentToNullClinic_Then_ShouldReturnNotFound()
        {
            //Arrange
            HttpClient httpClient = GetHttpClient("VetAppointmentTest8");

            CreateVetClinicDto createVetClinicDto = CreateClinitSUT();
            CreateAppointmentDto appointment = CreateAppointmentSUT();
            VetDto vetDto = CreateVetSUT();
            PetDto petDto = CreatePetSUT();


            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, createVetClinicDto);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            var vetResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/vet", vetDto);
            var vet = await vetResponse.Content.ReadFromJsonAsync<VetDto>();

            var petResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/pets", new List<PetDto> { petDto });
            var pet = await petResponse.Content.ReadFromJsonAsync<List<PetDto>>();

            appointment.VetId = vet.Id;
            appointment.PetId = pet.First().Id;

            // Act
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{Guid.NewGuid()}/appointment", appointment);

            // Assert
            resultResponse.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_RegisterAppoientmentToClinicWithInvalidVet_Then_ShouldReturnNotFound()
        {
            //Arrange
            HttpClient httpClient = GetHttpClient("VetAppointmentTest8");

            CreateVetClinicDto createVetClinicDto = CreateClinitSUT();
            CreateAppointmentDto appointment = CreateAppointmentSUT();
            PetDto petDto = CreatePetSUT();


            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, createVetClinicDto);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            var petResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/pets", new List<PetDto> { petDto });
            var pet = await petResponse.Content.ReadFromJsonAsync<List<PetDto>>();

            appointment.VetId = Guid.NewGuid();
            appointment.PetId = pet.First().Id;

            // Act
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/appointment", appointment);

            // Assert
            resultResponse.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_RegisterAppoientmentToClinicWithInvalidPet_Then_ShouldReturnNotFound()
        {
            //Arrange
            HttpClient httpClient = GetHttpClient("VetAppointmentTest8");

            CreateVetClinicDto createVetClinicDto = CreateClinitSUT();
            CreateAppointmentDto appointment = CreateAppointmentSUT();
            VetDto vetDto = CreateVetSUT();


            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, createVetClinicDto);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            var vetResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/vet", vetDto);
            var vet = await vetResponse.Content.ReadFromJsonAsync<VetDto>();

            appointment.VetId = vet.Id;
            appointment.PetId = Guid.NewGuid();

            // Act
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{Guid.NewGuid()}/appointment", appointment);

            // Assert
            resultResponse.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_RegisterVetToClinic_Then_ShouldSaveVetInClinicAsync()
        {
            //Arrange
            HttpClient httpClient = GetHttpClient("VetAppointmentTest4");

            var createVetClinicDto = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, createVetClinicDto);
            var vet = CreateVetSUT();
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            // Act
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/vet", vet);

            // Assert
            resultResponse.EnsureSuccessStatusCode();
            resultResponse.StatusCode.Should().Be(HttpStatusCode.Created);
        }

        [Fact]
        public async void When_RegisterVetToInvalidClinicId_Then_ShouldSaveVetInClinicAsync()
        {
            //Arrange
            HttpClient httpClient = GetHttpClient("When_RegisterVetToInvalidClinicId_Then_ShouldSaveVetInClinicAsync");

            var createVetClinicDto = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, createVetClinicDto);
            var vet = CreateVetSUT();
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            // Act
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{Guid.NewGuid()}/vet", vet);

            // Assert
            resultResponse.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_UpdateVet_Then_ShouldUpdateVetInClinic()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("VetAppointmentTest3");

            var clinicSUT = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, clinicSUT);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            var vetSUT = CreateVetSUT();
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/vet", vetSUT);
            var vet = await resultResponse.Content.ReadFromJsonAsync<VetDto>();

            vet.Name = "UpdatedFirstName";

            // Act
            var updateVetResponse = await httpClient.PutAsJsonAsync($"{ApiURL}/{clinic.Id}/vet/{vet.Id}", vet);

            // Assert
            updateVetResponse.EnsureSuccessStatusCode();
            updateVetResponse.StatusCode.Should().Be(HttpStatusCode.NoContent);
        }

        [Fact]
        public async void When_UpdateVetWithInvalidClinic_Then_ShouldReturnNotFound()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("When_UpdateVetWithInvalidClinic_Then_ShouldReturnNotFound");

            var clinicSUT = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, clinicSUT);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            var vetSUT = CreateVetSUT();
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/vet", vetSUT);
            var vet = await resultResponse.Content.ReadFromJsonAsync<VetDto>();

            vet.Name = "UpdatedFirstName";

            // Act
            var updateVetResponse = await httpClient.PutAsJsonAsync($"{ApiURL}/{Guid.NewGuid()}/vet/{vet.Id}", vet);

            // Assert
            updateVetResponse.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_UpdateInvalidVet_Then_ShouldReturnNotFound()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("When_UpdateInvalidVet_Then_ShouldReturnNotFound");

            var clinicSUT = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, clinicSUT);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            var vetSUT = CreateVetSUT();
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/vet", vetSUT);
            var vet = await resultResponse.Content.ReadFromJsonAsync<VetDto>();

            vet.Name = "UpdatedFirstName";

            // Act
            var updateVetResponse = await httpClient.PutAsJsonAsync($"{ApiURL}/{clinic.Id}/vet/{Guid.NewGuid()}", vet);

            // Assert
            updateVetResponse.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_UpdateVetWithInvalidData_Then_ShouldReturnNotFound()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("When_UpdateVetWithInvalidData_Then_ShouldReturnNotFound");

            var clinicSUT = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, clinicSUT);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            var vetSUT = CreateVetSUT();
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/vet", vetSUT);
            var vet = await resultResponse.Content.ReadFromJsonAsync<VetDto>();

            vet.Email = "InvalidEmail";

            // Act
            var updateVetResponse = await httpClient.PutAsJsonAsync($"{ApiURL}/{clinic.Id}/vet/{vet.Id}", vet);

            // Assert
            updateVetResponse.StatusCode.Should().Be(HttpStatusCode.BadRequest);
        }

        [Fact]
        public async void When_DeleteVet_Then_ShouldDeleteVetFromClinic()
        {
            //Arrange
            HttpClient httpClient = GetHttpClient("VetAppointmentTest2");

            var clinicSUT = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, clinicSUT);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            var vetSUT = CreateVetSUT();
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/vet", vetSUT);
            var vet = await resultResponse.Content.ReadFromJsonAsync<VetDto>();

            // Act
            var deleteVetResponse = await httpClient.DeleteAsync($"{ApiURL}/{clinic.Id}/vet/{vet.Id}");

            // Assert
            deleteVetResponse.EnsureSuccessStatusCode();
            deleteVetResponse.StatusCode.Should().Be(HttpStatusCode.NoContent);
        }

        [Fact]
        public async void When_DeleteVetWithInvalidClinic_Then_ShouldReturnNotFound()
        {
            //Arrange
            HttpClient httpClient = GetHttpClient("When_DeleteVetWithInvalidClinic_Then_ShouldReturnNotFound");

            var clinicSUT = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, clinicSUT);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            var vetSUT = CreateVetSUT();
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/vet", vetSUT);
            var vet = await resultResponse.Content.ReadFromJsonAsync<VetDto>();

            // Act
            var deleteVetResponse = await httpClient.DeleteAsync($"{ApiURL}/{Guid.NewGuid()}/vet/{vet.Id}");

            // Assert
            deleteVetResponse.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_DeleteVetWithInvalidVetId_Then_ShouldReturnNotFound()
        {
            //Arrange
            HttpClient httpClient = GetHttpClient("When_DeleteVetWithInvalidVetId_Then_ShouldReturnNotFound");

            var clinicSUT = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, clinicSUT);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            var vetSUT = CreateVetSUT();
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/vet", vetSUT);
            var vet = await resultResponse.Content.ReadFromJsonAsync<VetDto>();

            // Act
            var deleteVetResponse = await httpClient.DeleteAsync($"{ApiURL}/{clinic.Id}/vet/{Guid.NewGuid()}");

            // Assert
            deleteVetResponse.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_DeletePet_Then_ShouldDeletePetFromClinic()
        {
            //Arrange
            HttpClient httpClient = GetHttpClient("When_DeletePet_Then_ShouldDeletePetFromClinic");

            var clinicSUT = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, clinicSUT);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            var petSUT = CreatePetSUT();
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/pets", new List<PetDto> { petSUT } );
            var pets = await resultResponse.Content.ReadFromJsonAsync<List<PetDto>>();

            // Act
            var deleteVetResponse = await httpClient.DeleteAsync($"{ApiURL}/{clinic.Id}/pet/{pets.First().Id}");

            // Assert
            deleteVetResponse.EnsureSuccessStatusCode();
            deleteVetResponse.StatusCode.Should().Be(HttpStatusCode.NoContent);
        }

        [Fact]
        public async void When_DeletePetWithInvalidClinicId_Then_ShouldReturnNotFound()
        {
            //Arrange
            HttpClient httpClient = GetHttpClient("When_DeletePetWithInvalidClinicId_Then_ShouldReturnNotFound");

            var clinicSUT = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, clinicSUT);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            var petSUT = CreatePetSUT();
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/pets", new List<PetDto> { petSUT });
            var pets = await resultResponse.Content.ReadFromJsonAsync<List<PetDto>>();

            // Act
            var deleteVetResponse = await httpClient.DeleteAsync($"{ApiURL}/{Guid.NewGuid()}/pet/{pets.First().Id}");

            // Assert
            deleteVetResponse.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_DeletePetWithInvalidPetId_Then_ShouldReturnNotFound()
        {
            //Arrange
            HttpClient httpClient = GetHttpClient("When_DeletePetWithInvalidClinicId_Then_ShouldReturnNotFound");

            var clinicSUT = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, clinicSUT);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            var petSUT = CreatePetSUT();
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/pets", new List<PetDto> { petSUT });
            var pets = await resultResponse.Content.ReadFromJsonAsync<List<PetDto>>();

            // Act
            var deleteVetResponse = await httpClient.DeleteAsync($"{ApiURL}/{clinic.Id}/pet/{Guid.NewGuid()}");

            // Assert
            deleteVetResponse.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_DeleteClinic_Then_ShouldDeleteClinic()
        {
            //Arrange
            HttpClient httpClient = GetHttpClient("VetAppointmentTest1");

            var clinicSUT = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, clinicSUT);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            // Act
            var deleteClinicResponse = await httpClient.DeleteAsync($"{ApiURL}/{clinic.Id}");

            // Assert
            deleteClinicResponse.EnsureSuccessStatusCode();
            deleteClinicResponse.StatusCode.Should().Be(HttpStatusCode.NoContent);
        }

        [Fact]
        public async void When_DeleteClinicWithInvalidId_Then_ShouldReturnNotFound()
        {
            //Arrange
            HttpClient httpClient = GetHttpClient("When_DeleteClinicWithInvalidId_Then_ShouldReturnNotFound");

            var clinicSUT = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, clinicSUT);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            // Act
            var deleteClinicResponse = await httpClient.DeleteAsync($"{ApiURL}/{Guid.NewGuid()}");

            // Assert
            deleteClinicResponse.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_UpdatePet_Then_ShouldUpdatePetInClinic()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("When_UpdatePet_Then_ShouldUpdatePetInClinic");

            var clinicSUT = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, clinicSUT);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            var petSut = CreatePetSUT();
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/pets", new List<PetDto> { petSut } );
            var pets = await resultResponse.Content.ReadFromJsonAsync<List<PetDto>>();
            var pet = pets.First();
            
            pet.Name = "updateName";

            // Act
            var updateVetResponse = await httpClient.PutAsJsonAsync($"{ApiURL}/{clinic.Id}/pet/{pet.Id}", pet);

            // Assert
            updateVetResponse.EnsureSuccessStatusCode();
            updateVetResponse.StatusCode.Should().Be(HttpStatusCode.NoContent);
        }

        [Fact]
        public async void When_UpdatePetWithInvalidClinic_Then_ShouldReturnNotFound()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("When_UpdatePetWithInvalidClinic_Then_ShouldReturnNotFound");

            var clinicSUT = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, clinicSUT);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            var petSut = CreatePetSUT();
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/pets", new List<PetDto> { petSut });
            var pets = await resultResponse.Content.ReadFromJsonAsync<List<PetDto>>();
            var pet = pets.First();

            pet.Name = "updateName";

            // Act
            var updateVetResponse = await httpClient.PutAsJsonAsync($"{ApiURL}/{Guid.NewGuid()}/pet/{pet.Id}", pet);

            // Assert
            updateVetResponse.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async void When_UpdatePetWithInvalidPetId_Then_ShouldReturnNotFound()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("When_UpdatePetWithInvalidPetId_Then_ShouldReturnNotFound");

            var clinicSUT = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, clinicSUT);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            var petSut = CreatePetSUT();
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/pets", new List<PetDto> { petSut });
            var pets = await resultResponse.Content.ReadFromJsonAsync<List<PetDto>>();
            var pet = pets.First();

            pet.Name = "updateName";

            // Act
            var updateVetResponse = await httpClient.PutAsJsonAsync($"{ApiURL}/{clinic.Id}/pet/{Guid.NewGuid()}", pet);

            // Assert
            updateVetResponse.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }


        [Fact]
        public async void When_UpdatePetWithInvalidPetData_Then_ShouldReturnNotFound()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("When_UpdatePetWithInvalidPetId_Then_ShouldReturnNotFound");

            var clinicSUT = CreateClinitSUT();
            var createClinicResponse = await httpClient.PostAsJsonAsync(ApiURL, clinicSUT);
            var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

            var petSut = CreatePetSUT();
            var resultResponse = await httpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/pets", new List<PetDto> { petSut });
            var pets = await resultResponse.Content.ReadFromJsonAsync<List<PetDto>>();
            var pet = pets.First();

            pet.Race = "badRace";

            // Act
            var updateVetResponse = await httpClient.PutAsJsonAsync($"{ApiURL}/{clinic.Id}/pet/{pet.Id}", pet);

            // Assert
            updateVetResponse.StatusCode.Should().Be(HttpStatusCode.BadRequest);
        }
        
        private static CreateVetClinicDto CreateClinitSUT()
        {
            return new CreateVetClinicDto()
            {
                Name = "Pet Lovers",
                Address = "strada animalutelor",
                NumberOfPlaces = 3,
                ContactEmail = "love@pets.com",
                ContactPhone = "+40742845280"
            };
        }

        private static PetDto CreatePetSUT()
        {
            return new PetDto()
            {
                Name = "Bobita",
                Birthdate = DateTime.Now.AddYears(-1).ToString(),
                Race = AnimalRace.Rabbit.ToString(),
                Gender = AnimalGender.Male.ToString()
            };
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
    
        private static CreateAppointmentDto CreateAppointmentSUT()
        {
            return new CreateAppointmentDto()
            {
                EstimatedDurationInMinutes = 30,
                ScheduledDate = DateTime.Now.AddDays(1).ToString(),
                PetId = Guid.Empty,
                VetId = Guid.Empty,
                TreatmentId = Guid.NewGuid(),
                MedicalHistoryId = Guid.NewGuid()
            };
        }
    }
}
