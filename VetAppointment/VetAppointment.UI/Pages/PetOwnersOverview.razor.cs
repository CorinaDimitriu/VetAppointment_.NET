using Microsoft.AspNetCore.Components;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Services;

#nullable disable
namespace VetAppointment.UI.Pages
{
    public partial class PetOwnersOverview : ComponentBase
    {
        [Inject]
        public IPetOwnerDataService PetOwnerDataService { get; set; }

        public List<PetOwner> PetOwners { get; set; } = default!;
        protected async override Task OnInitializedAsync()
        {
            PetOwners = (await PetOwnerDataService.GetAllPetOwners()).ToList();

            PetOwners.ForEach(p => { Console.WriteLine(p.Id + " " + p.Name); });
        }
    }
}