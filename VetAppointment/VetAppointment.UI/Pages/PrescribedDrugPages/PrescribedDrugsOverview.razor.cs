using Microsoft.AspNetCore.Components;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Services;

#nullable disable
namespace VetAppointment.UI.Pages.PrescribedDrugPages
{
    public partial class PrescribedDrugsOverview : ComponentBase
    {
        [Inject]
        public IPrescribedDrugDataService PrescribedDrugDataService { get; set; }

        public List<PrescribedDrug> PrescribedDrugsToGet { get; set; } = default!;
        protected async override Task OnInitializedAsync()
        {
            PrescribedDrugsToGet = (await PrescribedDrugDataService.GetAllPrescribedDrugs()).ToList();
        }
    }
}