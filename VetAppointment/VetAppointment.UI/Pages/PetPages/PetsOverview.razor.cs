using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Services;

#nullable disable
namespace VetAppointment.UI.Pages.PetPages
{
    public partial class PetsOverview : ComponentBase
    {
        [Inject]
        public IPetDataService PetDataService { get; set; }

        [Inject]
        public IJSRuntime JSRuntime { get; set; }

        public List<Pet> Pets { get; set; } = default!;
        protected async override Task OnInitializedAsync()
        {
            var jwt = await JSRuntime.InvokeAsync<string>("ReadCookie", "JWT");
            Pets = (await PetDataService.GetAllPets(jwt)).ToList();
        }
    }
}