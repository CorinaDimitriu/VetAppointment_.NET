using Microsoft.AspNetCore.Components;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages
{
#nullable disable
    public partial class VetsOverview : ComponentBase
    {
        [Inject]
        public IVetDataService VetDataService { get; set; }

        public List<Vet> Vets { get; set; } = default!;
        protected async override Task OnInitializedAsync()
        {
            Vets = (await VetDataService.GetAllVets()).ToList();
        }
    }
}