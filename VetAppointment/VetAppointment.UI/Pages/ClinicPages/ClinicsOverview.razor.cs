using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain.Enums;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages.ClinicPages
{
#nullable disable
    public partial class ClinicsOverview : ComponentBase
    {
        [Inject]
        public IVetClinicDataService VetClinicDataService { get; set; }
        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }
        public List<VetClinic> Clinics { get; set; } = default!;
        public VetClinic Clinic { get; set; } = new VetClinic();
        public List<string> Specialisations { get; set; } =
            Enum.GetNames(typeof(VetSpecialisation)).Select(s => s.ToString()).ToList();
        public List<string> Races { get; set; } =
            Enum.GetNames(typeof(AnimalRace)).Select(s => s.ToString()).ToList();

        protected async override Task OnInitializedAsync()
        {
            Clinics = (await VetClinicDataService.GetAllClinics()).ToList();
        }

        protected async Task CreateClinic()
        {
            Clinic = await VetClinicDataService.AddClinic(Clinic);
            Clinics = (await VetClinicDataService.GetAllClinics()).ToList();
        }

        protected async Task DeleteClinic(Guid clinicId)
        {
            bool isDeleting = await JSRuntime.InvokeAsync<bool>("ConfirmDelete", "clinic", clinicId);
            if (isDeleting)
            {
                await VetClinicDataService.DeleteClinicById(clinicId);
                Clinics = (await VetClinicDataService.GetAllClinics()).ToList();
            }
        }

        protected void NavigateToEditPage(Guid clinicId)
        {
            NavigationManager.NavigateTo($"/clinic/{clinicId}");
        }
    }
}