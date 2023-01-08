using Bunit;
using FluentAssertions;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.PetOwnerPages;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Test
{
    public class PetOwnersOverviewTests
    {
        [Fact]
        public void When_RenderComponentPetOwnersOverview_Then_ShouldRetrieveAllPetOwners()
        {
            var mockClient = new Mock<IPetOwnerDataService>();
            var context = new TestContext();
            context.Services.AddSingleton(mockClient.Object);

            var petOwners = PetOwnersForTest();
            mockClient.Setup(c => c.GetAllPetOwners()).ReturnsAsync(petOwners);

            var cut = context.RenderComponent<PetOwnersOverview>();

            cut.Instance.PetOwnersToGet.Should().NotBeNull();
            var tdElements = cut.FindAll("td");
            tdElements[0].TextContent.MarkupMatches(petOwners[0].Id.ToString());
            tdElements[1].TextContent.MarkupMatches("Ion");
            tdElements[2].TextContent.MarkupMatches("Ionescu");
            tdElements[3].TextContent.MarkupMatches("05-03-1973");
            tdElements[4].TextContent.MarkupMatches("Male");
            tdElements[5].TextContent.MarkupMatches("Str. Rozelor");
            tdElements[6].TextContent.MarkupMatches("ion@email.com");
            tdElements[7].TextContent.MarkupMatches("+4071692549");
        }

        private static List<PetOwner> PetOwnersForTest()
        {
            return new List<PetOwner>
            {
                new PetOwner()
                {
                    Id = Guid.NewGuid(),
                    Name = "Ion",
                    Surname = "Ionescu",
                    Birthdate = "05-03-1973",
                    Gender = "Male",
                    Address = "Str. Rozelor",
                    Email = "ion@email.com",
                    Phone = "+40716925492"
                }
            };
        }
    }
}
