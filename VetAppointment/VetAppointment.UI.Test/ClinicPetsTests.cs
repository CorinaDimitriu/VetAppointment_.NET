using Bunit;
using FluentAssertions;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.ClinicPages;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Test
{
    public class ClinicPetsTests
    {
        [Fact]
        public void When_RenderComponentClinicPets_Then_ShouldRetrieveAllPets()
        {
            var mockClient = new Mock<IVetClinicDataService>();
            var context = new TestContext();
            context.Services.AddSingleton(mockClient.Object);

            var pets = PetsForTest();
            var clinicId = Guid.NewGuid();
            mockClient.Setup(c => c.GetPetsByClinicId(clinicId)).ReturnsAsync(pets);

            var cut = context.RenderComponent<ClinicPets>(parameters => parameters.Add(p => p.ClinicId, clinicId));
            cut.Instance.PetsToGet.Should().NotBeNull();
            var tdElements = cut.FindAll("td");
            tdElements[0].TextContent.MarkupMatches(pets[0].Id.ToString());
            tdElements[1].TextContent.MarkupMatches("Bobby");
            tdElements[2].TextContent.MarkupMatches("12-10-2017");
            tdElements[3].TextContent.MarkupMatches("Male");
            tdElements[4].TextContent.MarkupMatches("Delete");
            tdElements[5].MarkupMatches("<td><button type=\"button\" class=\"btn btn-danger\">Delete</button></td>");
        }

        private static List<Pet> PetsForTest()
        {
            return new List<Pet>()
            {
                new Pet()
                {
                    Id = Guid.NewGuid(),
                    Name = "Bobby",
                    Birthdate = "12-10-2017",
                    Race = "Dog",
                    Gender = "Male"
                }
            };
        }
    }
}
