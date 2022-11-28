using Microsoft.AspNetCore.Components;
using VetAppointment.Domain;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages
{
    public partial class ClinicsOverview : ComponentBase
    {
        [Inject]
        public IVetClinicDataService VetClinicDataService { get; set; }
        public List<VetClinic> Clinics { get; set; } = default!;
        public VetClinic Clinic { get; set; } = default!;
        public bool IsCreating { get; set; } = false;

        protected async override Task OnInitializedAsync()
        {
            Clinics = (await VetClinicDataService.GetAllClinics()).ToList();
        }

        protected async Task Submit()
        {
            if (IsCreating)
            {
                Clinic = await VetClinicDataService.AddClinic(Clinic);
            }
        }

        protected void ShowCreate()
        {
            Clinic = new();
            IsCreating = true;
        }
    }
}
