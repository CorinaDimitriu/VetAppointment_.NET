using Bunit;
using FluentAssertions;
using Microsoft.AspNetCore.Components;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.ClinicPages;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Test
{
    public class ClinicVetsTests
    {
        [Fact]
        public void When_RenderComponentClinicVets_Then_ShouldRetrieveAllVets()
        {
            var mockClient = new Mock<IVetClinicDataService>();
            var context = new TestContext();
            context.Services.AddSingleton(mockClient.Object);

            var vets = VetsForTest();
            var clinicId = Guid.NewGuid();
            mockClient.Setup(c => c.GetVetsByClinicId(clinicId)).ReturnsAsync(vets);

            var cut = context.RenderComponent<ClinicVets>(parameters => parameters.Add(p => p.ClinicId, clinicId));
            cut.Instance.VetsToGet.Should().NotBeNull();
            var tdElements = cut.FindAll("td");
            tdElements[0].TextContent.MarkupMatches(vets[0].Id.ToString());
            tdElements[1].TextContent.MarkupMatches("Valentina");
            tdElements[2].TextContent.MarkupMatches("Agachi");
            tdElements[3].TextContent.MarkupMatches("09-04-1979");
            tdElements[4].TextContent.MarkupMatches("Female");
            tdElements[5].TextContent.MarkupMatches("vale@work.com");
            tdElements[6].TextContent.MarkupMatches("+40738551919");
            tdElements[7].TextContent.MarkupMatches("Edit");
            tdElements[7].MarkupMatches("<td><button type=\"button\" class=\"btn btn-danger\">Edit</button></td>");
            tdElements[8].TextContent.MarkupMatches("Delete");
            tdElements[8].MarkupMatches("<td><button type=\"button\" class=\"btn btn-danger\">Delete</button></td>");
        }

        [Fact]
        public void When_PressEditButton_Then_ShouldNavigateToEditPage()
        {
            var mockClient = new Mock<IVetClinicDataService>();
            var context = new TestContext();
            context.Services.AddSingleton(mockClient.Object);

            var vets = VetsForTest();
            var clinicId = Guid.NewGuid();
            mockClient.Setup(c => c.GetVetsByClinicId(clinicId)).ReturnsAsync(vets);

            var nav = context.Services.GetRequiredService<NavigationManager>();

            var cut = context.RenderComponent<ClinicVets>(parameters => parameters.Add(p => p.ClinicId, clinicId));
            cut.Find("button").Click();
            nav.Uri.Should().Be($"http://localhost/{clinicId}/vet/{vets[0].Id}");
        }

        [Fact]
        public void When_PressDeleteButtonWithConfirmation_Then_ShouldDeleteVet()
        {
            var mockClient = new Mock<IVetClinicDataService>();
            var context = new TestContext();
            context.Services.AddSingleton(mockClient.Object);

            var vets = VetsForTest();
            var clinicId = Guid.NewGuid();
            mockClient.Setup(c => c.GetVetsByClinicId(clinicId)).ReturnsAsync(vets);
            context.JSInterop.Setup<bool>("ConfirmDelete", "vet", clinicId).SetResult(true);

            var cut = context.RenderComponent<ClinicVets>(parameters => parameters.Add(p => p.ClinicId, clinicId));
            mockClient.Setup(c => c.GetVetsByClinicId(clinicId));
            cut.FindAll("button")[1].Click();
            cut.Instance.VetsToGet.Count.Should().Be(0);
        }

        [Fact]
        public void When_PressDeleteButtonWithCancel_Then_ShouldNotDeleteVet()
        {
            var mockClient = new Mock<IVetClinicDataService>();
            var context = new TestContext();
            context.Services.AddSingleton(mockClient.Object);

            var vets = VetsForTest();
            var clinicId = Guid.NewGuid();
            mockClient.Setup(c => c.GetVetsByClinicId(clinicId)).ReturnsAsync(vets);
            context.JSInterop.Setup<bool>("ConfirmDelete", "vet", clinicId).SetResult(false);

            var cut = context.RenderComponent<ClinicVets>(parameters => parameters.Add(p => p.ClinicId, clinicId));
            mockClient.Setup(c => c.GetVetsByClinicId(clinicId));
            cut.FindAll("button")[1].Click();
            cut.Instance.VetsToGet.Count.Should().Be(1);
        }

        private static List<Vet> VetsForTest()
        {
            return new List<Vet>()
            {
                new Vet()
                {
                    Id = Guid.NewGuid(),
                    Name = "Valentina",
                    Surname = "Agachi",
                    Birthdate = "09-04-1979",
                    Gender = "Female",
                    Email = "vale@work.com",
                    Phone = "+40738551919",
                    Specialisation = "PawsSurgeon"
                }
            };
        }
    }
}
