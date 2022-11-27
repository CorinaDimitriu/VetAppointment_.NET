#nullable disable
namespace VetAppointment.Integration.Test
{
    public class VetClinicsControllerTests : BaseIntegrationTests
    {
        private const string ApiURL = "v1/api/vetclinics";

        [Fact]
        public async void When_CreateClinic_Then_ShouldReturnClinicInTheGetRequestAsync()
        {
            // Arrange
            CreateVetClinicDto vetClinicDto = CreateSUT();

            // Act
            var createClinicResponse = await HttpClient.PostAsJsonAsync(ApiURL, vetClinicDto);
            var getClinicResult = await HttpClient.GetAsync(ApiURL);

            // Assert
            createClinicResponse.EnsureSuccessStatusCode();
            createClinicResponse.StatusCode.Should().Be(HttpStatusCode.Created);

            getClinicResult.EnsureSuccessStatusCode();
            var clinics = await getClinicResult.Content.ReadFromJsonAsync<List<VetClinicDto>>();

            clinics.Should().HaveCount(1);
            clinics.Should().NotBeNull();
        }

        //[Fact]
        //public async Task When_RegisterPetsFamilyToClinic_Then_ShouldSavePetsInClinicAsync()
        //{
        //    // Arrange
        //    var createVetClinicDto = CreateSUT();
        //    var createClinicResponse = await HttpClient.PostAsJsonAsync(ApiURL, createVetClinicDto);
        //    var pets = new List<PetDto>
        //        {
        //            new PetDto
        //            {
        //                Name = "Bobita",
        //                Birthdate = "10/11/2021",
        //                Race = "Dog",
        //                Gender = "Male"
        //            }
        //        };
        //    var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

        //    // Act
        //    var resultResponse = await HttpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/persons", pets);

        //    // Assert
        //    resultResponse.EnsureSuccessStatusCode();
        //    resultResponse.StatusCode.Should().Be(System.Net.HttpStatusCode.NoContent);
        //}

        //[Fact]
        //public async void When_RegisterEmptyListOfPetsToClinic_Then_ShouldReturnBadRequestAsync()
        //{
        //    // Arrange
        //    CreateVetClinicDto createVetClinicDto = CreateSUT();
        //    var createClinicResponse = await HttpClient.PostAsJsonAsync(ApiURL, createVetClinicDto);
        //    var pets = new List<PetDto>();
        //    var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

        //    // Act
        //    var resultResponse = await HttpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/pets", pets);

        //    // Assert
        //    resultResponse.StatusCode.Should().Be(System.Net.HttpStatusCode.BadRequest);
        //}

        //[Fact]
        //public async void When_RegisterVetToClinic_Then_ShouldSaveVetInClinicAsync()
        //{
        //    // Arrange
        //    var createVetClinicDto = CreateSUT();
        //    var createClinicResponse = await HttpClient.PostAsJsonAsync(ApiURL, createVetClinicDto);
        //    var vet = new VetDto
        //    {
        //        Name = "Valentina",
        //        Surname = "Martiniuc",
        //        Birthdate = "02-06-1992",
        //        Gender = "Female",
        //        Email = "vale@work.com",
        //        Phone = "+40752492614"
        //    };
        //    var clinic = await createClinicResponse.Content.ReadFromJsonAsync<VetClinicDto>();

        //    // Act
        //    var resultResponse = await HttpClient.PostAsJsonAsync($"{ApiURL}/{clinic.Id}/vet", vet);

        //    // Assert
        //    resultResponse.EnsureSuccessStatusCode();
        //    resultResponse.StatusCode.Should().Be(HttpStatusCode.NoContent);
        //}

        private static CreateVetClinicDto CreateSUT()
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
    }
}
