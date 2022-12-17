using Microsoft.AspNetCore.Components;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Services;

#nullable disable
namespace VetAppointment.UI.Pages
{
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