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
    public class ClinicsOverviewTests
    {
        [Fact]
        public void When_RenderComponentClinicsOverview_Then_ShouldRetrieveAllClinics()
        {
            var mockClient = new Mock<IVetClinicDataService>();
            var context = new TestContext();
            context.Services.AddSingleton(mockClient.Object);

            var clinics = ClinicsForTest();
            mockClient.Setup(c => c.GetAllClinics()).ReturnsAsync(clinics);

            var cut = context.RenderComponent<ClinicsOverview>();
            //var h1Element = cut.Find("h1").TextContent;
            //var h3Element = cut.Find("h3").TextContent;

            //h1Element.MarkupMatches("Clinics Overview");
            //h3Element.MarkupMatches("All Clinics");
            
            //var thElements = cut.FindAll("th");
            //thElements[0].TextContent.MarkupMatches("Clinic ID");
            //thElements[1].TextContent.MarkupMatches("Clinic Name");
            //thElements[2].TextContent.MarkupMatches("Clinic Address");
            //thElements[3].TextContent.MarkupMatches("Clinic NumberOfPlaces");
            //thElements[4].TextContent.MarkupMatches("Clinic ContactEmail");
            //thElements[5].TextContent.MarkupMatches("Clinic ContactPhone");
            //thElements[6].TextContent.MarkupMatches("Edit");
            //thElements[7].TextContent.MarkupMatches("Delete");
            
            cut.Instance.Clinics.Should().NotBeNull();
            var tdElements = cut.FindAll("td");
            tdElements[0].TextContent.MarkupMatches(clinics[0].Id.ToString());
            tdElements[1].TextContent.MarkupMatches("Test Clinic");
            tdElements[2].TextContent.MarkupMatches("Test Address");
            tdElements[3].TextContent.MarkupMatches("10");
            tdElements[4].TextContent.MarkupMatches("email@test.com");
            tdElements[5].TextContent.MarkupMatches("+40712345678");
            tdElements[6].TextContent.MarkupMatches("Edit");
            tdElements[6].MarkupMatches("<td><button type=\"button\" class=\"btn btn-info\">Edit</button></td>");
            tdElements[7].TextContent.MarkupMatches("Delete");
            tdElements[7].MarkupMatches("<td><button type=\"button\" class=\"btn btn-danger\">Delete</button></td>");
        }

        [Fact]
        public void When_PressEditButton_Then_ShouldNavigateToEditPage()
        {
            var mockClient = new Mock<IVetClinicDataService>();
            var context = new TestContext();
            context.Services.AddSingleton(mockClient.Object);

            var clinics = ClinicsForTest();
            mockClient.Setup(c => c.GetAllClinics()).ReturnsAsync(clinics);

            var nav = context.Services.GetRequiredService<NavigationManager>();

            var cut = context.RenderComponent<ClinicsOverview>();
            cut.Find("button").Click();
            nav.Uri.Should().Be($"http://localhost/clinic/{clinics[0].Id}");
        }

        [Fact]
        public void When_PressDeleteButtonWithConfirmation_Then_ShouldDeleteClinic()
        {
            var mockClient = new Mock<IVetClinicDataService>();
            var context = new TestContext();
            context.Services.AddSingleton(mockClient.Object);

            var clinics = ClinicsForTest();
            mockClient.Setup(c => c.GetAllClinics()).ReturnsAsync(clinics);
            context.JSInterop.Setup<bool>("ConfirmDelete", "clinic", clinics[0].Id).SetResult(true);

            var cut = context.RenderComponent<ClinicsOverview>();
            mockClient.Setup(c => c.GetAllClinics());
            cut.FindAll("button")[1].Click();
            cut.Instance.Clinics.Count.Should().Be(0);
        }

        [Fact]
        public void When_PressDeleteButtonWithCancel_Then_ShouldNotDeleteClinic()
        {
            var mockClient = new Mock<IVetClinicDataService>();
            var context = new TestContext();
            context.Services.AddSingleton(mockClient.Object);

            var clinics = ClinicsForTest();
            mockClient.Setup(c => c.GetAllClinics()).ReturnsAsync(clinics);
            context.JSInterop.Setup<bool>("ConfirmDelete", "clinic", clinics[0].Id).SetResult(false);

            var cut = context.RenderComponent<ClinicsOverview>();
            mockClient.Setup(c => c.GetAllClinics());
            cut.FindAll("button")[1].Click();
            cut.Instance.Clinics.Count.Should().Be(1);
        }

        [Fact]
        public void When_PressButtonCreate_Then_ShouldCreateNewClinic()
        {
            var mockClient = new Mock<IVetClinicDataService>();
            var context = new TestContext();
            context.Services.AddSingleton(mockClient.Object);

            var clinics = ClinicsForTest();
            mockClient.Setup(c => c.GetAllClinics()).ReturnsAsync(clinics);
            var clinicToCreate = ClinicToCreate();


            var cut = context.RenderComponent<ClinicsOverview>();
            cut.Instance.Clinic = clinicToCreate;
            cut.Instance.Clinics.Count.Should().Be(1);
            cut.FindAll("button")[2].Click();
            cut.Instance.Clinics.Count.Should().Be(2);
        }

        private static List<VetClinic> ClinicsForTest()
        {
            return new List<VetClinic>
            {
                new VetClinic()
                {
                    Id = Guid.NewGuid(),
                    Name = "Test Clinic",
                    Address = "Test Address",
                    NumberOfPlaces = 10,
                    ContactEmail = "email@test.com",
                    ContactPhone = "+40712345678"
                }
            };
        }

        private static VetClinic ClinicToCreate()
        {
            return new VetClinic()
            {
                Id = Guid.NewGuid(),
                Name = "MyClinic",
                Address = "Str. Rozelor",
                NumberOfPlaces = 250,
                ContactEmail = "pets@email.com",
                ContactPhone = "+40716925692"
            };
        }
    }
}