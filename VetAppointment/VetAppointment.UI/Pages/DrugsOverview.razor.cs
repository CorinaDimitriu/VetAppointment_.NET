using Microsoft.AspNetCore.Components;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages
{
#nullable disable
    public partial class DrugsOverview : ComponentBase
    {
        [Inject]
        public IDrugDataService DrugDataService { get; set; }

        public List<Drug> Drugs { get; set; } = default!;
        protected async override Task OnInitializedAsync()
        {
            Drugs = (await DrugDataService.GetAllDrugs()).ToList();
        }
    }
}