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
    public class TreatmentsControllerTests : BaseIntegrationTests
    {

        private const string ApiURL = "v1/api/treatments";

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

        public TreatmentsControllerTests(WebApplicationFactory<VetClinicsController> factory) : base(factory) { }

        [Fact]
        public async void When_GetTreaments_Then_ShouldReturnOkAndTreatments()
        {
            {
                // Arrange
                HttpClient httpClient = GetHttpClient("When_GetTreaments_Then_ShouldReturnOkAndTreatments");
                
                // Act
                var response = await httpClient.GetAsync(ApiURL);
                var treatments = await response.Content.ReadFromJsonAsync<List<TreatmentDto>>();

                // Assert
                response.EnsureSuccessStatusCode();
                response.StatusCode.Should().Be(HttpStatusCode.OK);
                treatments.Should().NotBeNull();
            }
        }

        [Fact]
        public async void When_PostPrecribedDrugsToTreatment_Then_ShouldReturnNoContent()
        {
            {
                // Arrange
                HttpClient httpClient = GetHttpClient("When_PostPrecribedDrugsToTreatment_Then_ShouldReturnNoContent");
                var treatmentSut = CreateTreatmentSUT();
                var prescribedDrugSut = CreatePrescribedDrugDtoSUT();
                var drugSut = CreateDrugSUT();

                var postDrug = await httpClient.PostAsJsonAsync("v1/api/drugs", drugSut);
                var drug = await postDrug.Content.ReadFromJsonAsync<DrugDto>();

                prescribedDrugSut.DrugToPrescribeId = drug.Id;
                var postPrescribedDrug = await httpClient.PostAsJsonAsync("v1/api/PrescribedDrugs", prescribedDrugSut);
                var prescribedDrug = await postPrescribedDrug.Content.ReadFromJsonAsync<PrescribedDrugDto>();

                var postTreatment = await httpClient.PostAsJsonAsync(ApiURL, treatmentSut);
                var treatment = await postTreatment.Content.ReadFromJsonAsync<TreatmentDto>();
                prescribedDrug.DrugToPrescribeId = drug.Id;
                // Act

                var post_PrescribedDrug_To_Treatment = await httpClient.PostAsJsonAsync(
                    $"{ApiURL}/{treatment.Id}/prescribedDrugs", 
                    new List<PrescribedDrugDto>() { prescribedDrug }
                );

                // Assert
                post_PrescribedDrug_To_Treatment.StatusCode.Should().Be(HttpStatusCode.NoContent);
            }
        }

        [Fact]
        public async void When_PostPrecribedDrugsToTreatmentWithInvalidTreatmentId_Then_ShouldReturnNotFound()
        {
            {
                // Arrange
                HttpClient httpClient = GetHttpClient("When_PostPrecribedDrugsToTreatment_Then_ShouldReturnNoContent");
                var treatmentSut = CreateTreatmentSUT();
                var prescribedDrugSut = CreatePrescribedDrugDtoSUT();
                var drugSut = CreateDrugSUT();

                var postDrug = await httpClient.PostAsJsonAsync("v1/api/drugs", drugSut);
                var drug = await postDrug.Content.ReadFromJsonAsync<DrugDto>();

                prescribedDrugSut.DrugToPrescribeId = drug.Id;
                var postPrescribedDrug = await httpClient.PostAsJsonAsync("v1/api/PrescribedDrugs", prescribedDrugSut);
                var prescribedDrug = await postPrescribedDrug.Content.ReadFromJsonAsync<PrescribedDrugDto>();

                var postTreatment = await httpClient.PostAsJsonAsync(ApiURL, treatmentSut);
                var treatment = await postTreatment.Content.ReadFromJsonAsync<TreatmentDto>();
                // Act

                var post_PrescribedDrug_To_Treatment = await httpClient.PostAsJsonAsync(
                    $"{ApiURL}/{Guid.NewGuid()}/prescribedDrugs",
                    new List<PrescribedDrugDto>() { prescribedDrug }
                );

                // Assert
                post_PrescribedDrug_To_Treatment.StatusCode.Should().Be(HttpStatusCode.NotFound);
            }
        }

        [Fact]
        public async void When_PostTreatmentWithValidData_Then_ShouldReturnCreatedAndTreat()
        {
            // Arrange
            HttpClient httpClient = GetHttpClient("When_PostTreatmentWithValidData_Then_ShouldReturnCreatedAndTreat");
            var treatSut = CreateTreatmentSUT();

            // Act
            var response = await httpClient.PostAsJsonAsync(ApiURL, treatSut);
            var treatment = await response.Content.ReadFromJsonAsync<TreatmentDto>();

            // Assert
            response.EnsureSuccessStatusCode();
            response.StatusCode.Should().Be(HttpStatusCode.Created);
            treatment.Should().NotBeNull();
            treatment.Description.Should().Be(treatSut.Description);
        }

        [Fact]
        public async void When_PutTreamentWithValidData_Then_ShouldReturnNoContent()
        {
            {
                // Arrange
                HttpClient httpClient = GetHttpClient("When_PutTreamentWithValidData_Then_ShoulReturnNoContent");
                var treatmentSut = CreateTreatmentSUT();

                var postTreatment = await httpClient.PostAsJsonAsync(ApiURL, treatmentSut);
                var treatment = await postTreatment.Content.ReadFromJsonAsync<TreatmentDto>();
                // Act

                treatment.Description = "New Description";

                var post_PrescribedDrug_To_Treatment = await httpClient.PutAsJsonAsync($"{ApiURL}/{treatment.Id}", treatment);

                // Assert
                post_PrescribedDrug_To_Treatment.StatusCode.Should().Be(HttpStatusCode.NoContent);
            }
        }

        [Fact]
        public async void When_PutTreamentWithInvalidTreatmentId_Then_ShouldReturnNoContent()
        {
            {
                // Arrange
                HttpClient httpClient = GetHttpClient("When_PutTreamentWithInvalidTreatmentId_Then_ShoulReturnNoContent");
                var treatmentSut = CreateTreatmentSUT();

                var postTreatment = await httpClient.PostAsJsonAsync(ApiURL, treatmentSut);
                var treatment = await postTreatment.Content.ReadFromJsonAsync<TreatmentDto>();
                // Act

                treatment.Description = "New Description";

                var post_PrescribedDrug_To_Treatment = await httpClient.PutAsJsonAsync($"{ApiURL}/{Guid.NewGuid()}", treatment);

                // Assert
                post_PrescribedDrug_To_Treatment.StatusCode.Should().Be(HttpStatusCode.NotFound);
            }
        }

        [Fact]
        public async void When_PutTreamentWithNullDescription_Then_ShouldReturnNoContent()
        {
            {
                // Arrange
                HttpClient httpClient = GetHttpClient("When_PutTreamentWithInvalidTreatmentId_Then_ShoulReturnNoContent");
                var treatmentSut = CreateTreatmentSUT();

                var postTreatment = await httpClient.PostAsJsonAsync(ApiURL, treatmentSut);
                var treatment = await postTreatment.Content.ReadFromJsonAsync<TreatmentDto>();
                // Act

                treatment.Description = null;

                var post_PrescribedDrug_To_Treatment = await httpClient.PutAsJsonAsync($"{ApiURL}/{treatment.Id}", treatment);

                // Assert
                post_PrescribedDrug_To_Treatment.StatusCode.Should().Be(HttpStatusCode.BadRequest);
            }
        }

        [Fact]
        public async void When_PutPrecribedDrugsToTreatment_Then_ShouldReturnNoContent()
        {
            {
                // Arrange
                HttpClient httpClient = GetHttpClient("When_PostPrecribedDrugsToTreatment_Then_ShouldReturnNoContent");
                var treatmentSut = CreateTreatmentSUT();
                var prescribedDrugSut = CreatePrescribedDrugDtoSUT();
                var drugSut = CreateDrugSUT();

                var postDrug = await httpClient.PostAsJsonAsync("v1/api/drugs", drugSut);
                var drug = await postDrug.Content.ReadFromJsonAsync<DrugDto>();

                prescribedDrugSut.DrugToPrescribeId = drug.Id;
                var postPrescribedDrug = await httpClient.PostAsJsonAsync("v1/api/PrescribedDrugs", prescribedDrugSut);
                var prescribedDrug = await postPrescribedDrug.Content.ReadFromJsonAsync<PrescribedDrugDto>();

                var postTreatment = await httpClient.PostAsJsonAsync(ApiURL, treatmentSut);
                var treatment = await postTreatment.Content.ReadFromJsonAsync<TreatmentDto>();

                var post_PrescribedDrug_To_Treatment = await httpClient.PostAsJsonAsync(
                    $"{ApiURL}/{treatment.Id}/prescribedDrugs",
                    new List<PrescribedDrugDto>() { prescribedDrug }
                );

                prescribedDrug.DrugToPrescribeId = drug.Id;
                prescribedDrug.Quantity = 20;
                // Act

                var post_PrescribedDrug_To_Treatment_Update = await httpClient.PutAsJsonAsync(
                    $"{ApiURL}/{treatment.Id}/prescribedDrug/{prescribedDrug.Id}",
                    prescribedDrug
                );

                // Assert
                post_PrescribedDrug_To_Treatment_Update.StatusCode.Should().Be(HttpStatusCode.NoContent);
            }
        }

        [Fact]
        public async void When_PutPrecribedDrugsToTreatmentWithInvalidData_Then_ShouldReturnBadRequest()
        {
            {
                // Arrange
                HttpClient httpClient = GetHttpClient("When_PostPrecribedDrugsToTreatment_Then_ShouldReturnNoContent");
                var treatmentSut = CreateTreatmentSUT();
                var prescribedDrugSut = CreatePrescribedDrugDtoSUT();
                var drugSut = CreateDrugSUT();

                var postDrug = await httpClient.PostAsJsonAsync("v1/api/drugs", drugSut);
                var drug = await postDrug.Content.ReadFromJsonAsync<DrugDto>();

                prescribedDrugSut.DrugToPrescribeId = drug.Id;
                var postPrescribedDrug = await httpClient.PostAsJsonAsync("v1/api/PrescribedDrugs", prescribedDrugSut);
                var prescribedDrug = await postPrescribedDrug.Content.ReadFromJsonAsync<PrescribedDrugDto>();

                var postTreatment = await httpClient.PostAsJsonAsync(ApiURL, treatmentSut);
                var treatment = await postTreatment.Content.ReadFromJsonAsync<TreatmentDto>();

                var post_PrescribedDrug_To_Treatment = await httpClient.PostAsJsonAsync(
                    $"{ApiURL}/{treatment.Id}/prescribedDrugs",
                    new List<PrescribedDrugDto>() { prescribedDrug }
                );

                prescribedDrug.DrugToPrescribeId = drug.Id;
                prescribedDrug.Quantity = -20;
                // Act

                var post_PrescribedDrug_To_Treatment_Update = await httpClient.PutAsJsonAsync(
                    $"{ApiURL}/{treatment.Id}/prescribedDrug/{prescribedDrug.Id}",
                    prescribedDrug
                );

                // Assert
                post_PrescribedDrug_To_Treatment_Update.StatusCode.Should().Be(HttpStatusCode.BadRequest);
            }
        }

        [Fact]
        public async void When_PutPrecribedDrugsToTreatmentWithInvalidTreatmentId_Then_ShouldReturnNotFound()
        {
            {
                // Arrange
                HttpClient httpClient = GetHttpClient("When_PutPrecribedDrugsToTreatmentWithInvalidTreatmentId_Then_ShouldReturnNotFound");
                var treatmentSut = CreateTreatmentSUT();
                var prescribedDrugSut = CreatePrescribedDrugDtoSUT();
                var drugSut = CreateDrugSUT();

                var postDrug = await httpClient.PostAsJsonAsync("v1/api/drugs", drugSut);
                var drug = await postDrug.Content.ReadFromJsonAsync<DrugDto>();

                prescribedDrugSut.DrugToPrescribeId = drug.Id;
                var postPrescribedDrug = await httpClient.PostAsJsonAsync("v1/api/PrescribedDrugs", prescribedDrugSut);
                var prescribedDrug = await postPrescribedDrug.Content.ReadFromJsonAsync<PrescribedDrugDto>();

                var postTreatment = await httpClient.PostAsJsonAsync(ApiURL, treatmentSut);
                var treatment = await postTreatment.Content.ReadFromJsonAsync<TreatmentDto>();

                var post_PrescribedDrug_To_Treatment = await httpClient.PostAsJsonAsync(
                    $"{ApiURL}/{treatment.Id}/prescribedDrugs",
                    new List<PrescribedDrugDto>() { prescribedDrug }
                );

                prescribedDrug.DrugToPrescribeId = drug.Id;
                prescribedDrug.Quantity = 20;
                // Act

                var post_PrescribedDrug_To_Treatment_Update = await httpClient.PutAsJsonAsync(
                    $"{ApiURL}/{Guid.NewGuid()}/prescribedDrug/{prescribedDrug.Id}",
                    prescribedDrug
                );

                // Assert
                post_PrescribedDrug_To_Treatment_Update.StatusCode.Should().Be(HttpStatusCode.NotFound);
            }
        }

        [Fact]
        public async void When_PutPrecribedDrugsToTreatmentWithInvalidPrecribedDrugId_Then_ShouldReturnNotFound()
        {
            {
                // Arrange
                HttpClient httpClient = GetHttpClient("When_PutPrecribedDrugsToTreatmentWithInvalidPrecribedDrugId_Then_ShouldReturnNotFound");
                var treatmentSut = CreateTreatmentSUT();
                var prescribedDrugSut = CreatePrescribedDrugDtoSUT();
                var drugSut = CreateDrugSUT();

                var postDrug = await httpClient.PostAsJsonAsync("v1/api/drugs", drugSut);
                var drug = await postDrug.Content.ReadFromJsonAsync<DrugDto>();

                prescribedDrugSut.DrugToPrescribeId = drug.Id;
                var postPrescribedDrug = await httpClient.PostAsJsonAsync("v1/api/PrescribedDrugs", prescribedDrugSut);
                var prescribedDrug = await postPrescribedDrug.Content.ReadFromJsonAsync<PrescribedDrugDto>();

                var postTreatment = await httpClient.PostAsJsonAsync(ApiURL, treatmentSut);
                var treatment = await postTreatment.Content.ReadFromJsonAsync<TreatmentDto>();

                var post_PrescribedDrug_To_Treatment = await httpClient.PostAsJsonAsync(
                    $"{ApiURL}/{treatment.Id}/prescribedDrugs",
                    new List<PrescribedDrugDto>() { prescribedDrug }
                );

                prescribedDrug.DrugToPrescribeId = drug.Id;
                prescribedDrug.Quantity = 20;
                // Act

                var post_PrescribedDrug_To_Treatment_Update = await httpClient.PutAsJsonAsync(
                    $"{ApiURL}/{treatment.Id}/prescribedDrug/{Guid.NewGuid()}",
                    prescribedDrug
                );

                // Assert
                post_PrescribedDrug_To_Treatment_Update.StatusCode.Should().Be(HttpStatusCode.NotFound);
            }
        }

        [Fact]
        public async void When_PutPrecribedDrugsToTreatmentWithInvalidDrugId_Then_ShouldReturnNotFound()
        {
            {
                // Arrange
                HttpClient httpClient = GetHttpClient("When_PutPrecribedDrugsToTreatmentWithInvalidDrugId_Then_ShouldReturnNotFound");
                var treatmentSut = CreateTreatmentSUT();
                var prescribedDrugSut = CreatePrescribedDrugDtoSUT();
                var drugSut = CreateDrugSUT();

                var postDrug = await httpClient.PostAsJsonAsync("v1/api/drugs", drugSut);
                var drug = await postDrug.Content.ReadFromJsonAsync<DrugDto>();

                prescribedDrugSut.DrugToPrescribeId = drug.Id;
                var postPrescribedDrug = await httpClient.PostAsJsonAsync("v1/api/PrescribedDrugs", prescribedDrugSut);
                var prescribedDrug = await postPrescribedDrug.Content.ReadFromJsonAsync<PrescribedDrugDto>();

                var postTreatment = await httpClient.PostAsJsonAsync(ApiURL, treatmentSut);
                var treatment = await postTreatment.Content.ReadFromJsonAsync<TreatmentDto>();

                var post_PrescribedDrug_To_Treatment = await httpClient.PostAsJsonAsync(
                    $"{ApiURL}/{treatment.Id}/prescribedDrugs",
                    new List<PrescribedDrugDto>() { prescribedDrug }
                );

                prescribedDrug.DrugToPrescribeId = Guid.NewGuid();
                prescribedDrug.Quantity = 20;
                // Act

                var post_PrescribedDrug_To_Treatment_Update = await httpClient.PutAsJsonAsync(
                    $"{ApiURL}/{treatment.Id}/prescribedDrug/{prescribedDrug.Id}",
                    prescribedDrug
                );

                // Assert
                post_PrescribedDrug_To_Treatment_Update.StatusCode.Should().Be(HttpStatusCode.NotFound);
            }
        }

        [Fact]
        public async void When_DeleteTreatment_Then_ShouldRetrunNoContent()
        {
            // Arrange
            var httpClient = GetHttpClient("When_DeleteTreatment_Then_ShouldRetrunNoContent");

            var treatmentSut = CreateTreatmentSUT();

            var postTreatment = await httpClient.PostAsJsonAsync(ApiURL, treatmentSut);
            var treatment = postTreatment.Content.ReadFromJsonAsync<TreatmentDto>().Result;

            // Act
            var deleteTreatment = await httpClient.DeleteAsync($"{ApiURL}/{treatment.Id}");

            // Assert
            deleteTreatment.StatusCode.Should().Be(HttpStatusCode.NoContent);
;        }

        [Fact]
        public async void When_DeleteTreatmentWithInvalidTreatmentId_Then_ShouldRetrunNotFound()
        {
            // Arrange
            var httpClient = GetHttpClient("When_DeleteTreatment_Then_ShouldRetrunNoContent");

            // Act
            var deleteTreatment = await httpClient.DeleteAsync($"{ApiURL}/{Guid.NewGuid()}");

            // Assert
            deleteTreatment.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        private static CreateTreatmentDto CreateTreatmentSUT()
        {
            return new CreateTreatmentDto()
            {
                Description = "Test Description"
            };
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
