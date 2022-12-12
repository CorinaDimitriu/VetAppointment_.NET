using Microsoft.AspNetCore.Components;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages
{
#nullable disable
    public partial class PrescribedDrugsOverview : ComponentBase
    {
        [Inject]
        public IPrescribedDrugDataService PrescribedDrugDataService { get; set; }

        public List<PrescribedDrug> PrescribedDrugs { get; set; } = default!;
        protected async override Task OnInitializedAsync()
        {
            PrescribedDrugs = (await PrescribedDrugDataService.GetAllPrescribedDrugs()).ToList();
        }
    }
}