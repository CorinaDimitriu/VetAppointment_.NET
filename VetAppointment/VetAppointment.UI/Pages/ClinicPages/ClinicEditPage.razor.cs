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
        public VetClinic Clinic { get; set; } = default!;
        public ClinicModel ClinicToUpdate { get; set; } = default!;

        protected override async Task OnInitializedAsync()
        {
            Clinic = await VetClinicDataService.GetClinicById(ClinicId);
            ClinicToUpdate = new ClinicModel
            {
                Id = Clinic.Id.ToString(),
                Name = Clinic.Name,
                Address = Clinic.Address,
                NumberOfPlaces = Clinic.NumberOfPlaces,
                ContactEmail = Clinic.ContactEmail,
                ContactPhone = Clinic.ContactPhone
            };
        }
        
        protected async Task UpdateClinic()
        {
            await VetClinicDataService.UpdateClinic(ClinicId, ClinicToUpdate);
            await JSRuntime.InvokeVoidAsync("Alert", "The clinic has been updated successfully!");
        }

        protected void NavigateToAddPets()
        {
            NavigationManager.NavigateTo($"/clinic/{ClinicId}/pets");
        }

        protected void NavigateToAddVets()
        {
            NavigationManager.NavigateTo($"/clinic/{ClinicId}/vets");
        }

        protected void NavigateToAddAppointments()
        {
            NavigationManager.NavigateTo($"/clinic/{ClinicId}/appointments");
        }
    }
}
