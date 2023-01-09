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
            var jwt = await JSRuntime.InvokeAsync<string>("ReadCookie", "JWT");
            var bearer = await VetClinicDataService.AddClinic(Clinic, jwt);
            if (bearer == "Unauthorized")
            {
                await JSRuntime.InvokeVoidAsync("Alert", "Insufficient privileges!");
            }
            else
            {
                Clinic = new();
                await JSRuntime.InvokeVoidAsync("Alert", "The clinic has been successfully added!");
                Clinics = (await VetClinicDataService.GetAllClinics()).ToList();
            }
        }

        protected async Task DeleteClinic(Guid clinicId)
        {
            bool isDeleting = await JSRuntime.InvokeAsync<bool>("ConfirmDelete", "clinic", clinicId);
            if (isDeleting)
            {
                var jwt = await JSRuntime.InvokeAsync<string>("ReadCookie", "JWT");
                var bearer = await VetClinicDataService.DeleteClinicById(clinicId, jwt);
                if (bearer == "Unauthorized")
                {
                    await JSRuntime.InvokeVoidAsync("Alert", "Insufficient privileges!");
                }
                else
                {
                    await JSRuntime.InvokeVoidAsync("Alert", "The clinic has been successfully deleted!");
                    Clinics = (await VetClinicDataService.GetAllClinics()).ToList();
                }
            }
        }

        protected void NavigateToEditPage(Guid clinicId)
        {
            NavigationManager.NavigateTo($"/clinic/{clinicId}");
        }
    }
}