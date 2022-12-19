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
    public class ClinicEditPageTests
    {
        [Fact]
        public void When_RenderComponentClinicEditPage_Then_ShouldRetrieveClinicData()
        {
            var mockClient = new Mock<IVetClinicDataService>();
            var context = new TestContext();
            context.Services.AddSingleton(mockClient.Object);

            var clinic = ClinicForTest();
            mockClient.Setup(c => c.GetClinicById(clinic.Id)).ReturnsAsync(clinic);

            var cut = context.RenderComponent<ClinicEditPage>(parameters => parameters.Add(p => p.ClinicId, clinic.Id));
            cut.Instance.ClinicToUpdate.Should().NotBeNull();
            var tdElements = cut.FindAll("td");
            tdElements[0].TextContent.MarkupMatches(clinic.Id.ToString());
            tdElements[1].TextContent.MarkupMatches("Test Clinic");
            tdElements[2].TextContent.MarkupMatches("Test Address");
            tdElements[3].TextContent.MarkupMatches("10");
            tdElements[4].TextContent.MarkupMatches("email@test.com");
            tdElements[5].TextContent.MarkupMatches("+40712345678");
        }

        [Fact]
        public void When_PressAddPetsButton_Then_ShouldNavigateToAddPetsPage()
        {
            var mockClient = new Mock<IVetClinicDataService>();
            var context = new TestContext();
            context.Services.AddSingleton(mockClient.Object);

            var clinic = ClinicForTest();
            mockClient.Setup(c => c.GetClinicById(clinic.Id)).ReturnsAsync(clinic);

            var nav = context.Services.GetRequiredService<NavigationManager>();
            
            var cut = context.RenderComponent<ClinicEditPage>(parameters => parameters.Add(p => p.ClinicId, clinic.Id));
            cut.FindAll("button")[1].Click();
            nav.Uri.Should().Be($"http://localhost/clinic/{clinic.Id}/pets");
        }

        [Fact]
        public void When_PressAddVetsButton_Then_ShouldNavigateToAddVetsPage()
        {
            var mockClient = new Mock<IVetClinicDataService>();
            var context = new TestContext();
            context.Services.AddSingleton(mockClient.Object);

            var clinic = ClinicForTest();
            mockClient.Setup(c => c.GetClinicById(clinic.Id)).ReturnsAsync(clinic);

            var nav = context.Services.GetRequiredService<NavigationManager>();

            var cut = context.RenderComponent<ClinicEditPage>(parameters => parameters.Add(p => p.ClinicId, clinic.Id));
            cut.FindAll("button")[2].Click();
            nav.Uri.Should().Be($"http://localhost/clinic/{clinic.Id}/vets");
        }

        [Fact]
        public void When_PressAddAppointmentsButton_Then_ShouldNavigateToAddAppointmentsPage()
        {
            var mockClient = new Mock<IVetClinicDataService>();
            var context = new TestContext();
            context.Services.AddSingleton(mockClient.Object);

            var clinic = ClinicForTest();
            mockClient.Setup(c => c.GetClinicById(clinic.Id)).ReturnsAsync(clinic);

            var nav = context.Services.GetRequiredService<NavigationManager>();

            var cut = context.RenderComponent<ClinicEditPage>(parameters => parameters.Add(p => p.ClinicId, clinic.Id));
            cut.FindAll("button")[3].Click();
            nav.Uri.Should().Be($"http://localhost/clinic/{clinic.Id}/appointments");
        }

        private static VetClinic ClinicForTest()
        {
            return new VetClinic()
            {
                Id = Guid.NewGuid(),
                Name = "Test Clinic",
                Address = "Test Address",
                NumberOfPlaces = 10,
                ContactEmail = "email@test.com",
                ContactPhone = "+40712345678"
            };
        }
    }
}
