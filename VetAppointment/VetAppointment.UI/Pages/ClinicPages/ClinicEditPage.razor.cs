using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain;
using VetAppointment.Shared.Domain.Enums;
using VetAppointment.UI.Pages.Models;
using VetAppointment.UI.Pages.Services;

#nullable disable
namespace VetAppointment.UI.Pages.ClinicPages
{
    public partial class ClinicEditPage : ComponentBase
    {
        [Inject]
        public IVetClinicDataService VetClinicDataService { get; set; }
        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }
        [Parameter]
        public Guid ClinicId { get; set; }
        public List<string> Specialisations { get; set; } =
            Enum.GetNames(typeof(VetSpecialisation)).Select(s => s.ToString()).ToList();
        public ClinicModel ClinicToUpdate { get; set; } = new();
        public ClinicModel ClinicOld { get; set; } = new();

        protected override async Task OnInitializedAsync()
        {
            VetClinic Clinic = await VetClinicDataService.GetClinicById(ClinicId);
            ClinicOld = new ClinicModel
            {
                Name = Clinic.Name,
                Address = Clinic.Address,
                NumberOfPlaces = Clinic.NumberOfPlaces,
                ContactEmail = Clinic.ContactEmail,
                ContactPhone = Clinic.ContactPhone
            };
            ClinicToUpdate = new ClinicModel
            {
                Name = Clinic.Name,
                Address = Clinic.Address,
                NumberOfPlaces = Clinic.NumberOfPlaces,
                ContactEmail = Clinic.ContactEmail,
                ContactPhone = Clinic.ContactPhone
            };
        }

        protected async Task UpdateClinic()
        {
            var jwt = await JSRuntime.InvokeAsync<string>("ReadCookie", "JWT");
            var bearer = await VetClinicDataService.UpdateClinic(ClinicId, ClinicToUpdate, jwt);
            if (bearer == "Unauthorized")
            {
                await JSRuntime.InvokeVoidAsync("Alert", "Insufficient privileges!");
            }
            else
            {
                ClinicOld = new ClinicModel
                {
                    Name = ClinicToUpdate.Name,
                    Address = ClinicToUpdate.Address,
                    NumberOfPlaces = ClinicToUpdate.NumberOfPlaces,
                    ContactEmail = ClinicToUpdate.ContactEmail,
                    ContactPhone = ClinicToUpdate.ContactPhone
                };
                await JSRuntime.InvokeVoidAsync("Alert", "The clinic has been successfully updated!");
            }
        }

        protected void NavigateBack()
        {
            NavigationManager.NavigateTo($"/clinicsoverview");
        }

        protected void NavigateToPets()
        {
            NavigationManager.NavigateTo($"/clinic/{ClinicId}/pets");
        }

        protected void NavigateToVets()
        {
            NavigationManager.NavigateTo($"/clinic/{ClinicId}/vets");
        }

        protected void NavigateToAppointments()
        {
            NavigationManager.NavigateTo($"/clinic/{ClinicId}/appointments");
        }

        protected void NavigateToMedicalHistory()
        {
            NavigationManager.NavigateTo($"/clinic/{ClinicId}/medicalhistory");
        }
    }
}
