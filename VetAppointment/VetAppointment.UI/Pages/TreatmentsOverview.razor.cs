using Microsoft.AspNetCore.Components;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages
{
#nullable disable
    public partial class TreatmentsOverview : ComponentBase
    {
        [Inject]
        public ITreatmentDataService TreatmentDataService { get; set; }

        public List<Treatment> Treatments { get; set; } = default!;
        protected async override Task OnInitializedAsync()
        {
            Treatments = (await TreatmentDataService.GetAllTreatments()).ToList();
        }
    }
}