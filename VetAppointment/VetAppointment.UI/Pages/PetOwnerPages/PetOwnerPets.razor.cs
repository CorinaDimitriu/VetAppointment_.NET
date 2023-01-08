using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages.PetOwnerPages
{
    public partial class PetOwnerPets : ComponentBase
    {
        [Inject]
        public IPetOwnerDataService PetOwnerDataService { get; set; }
        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }
        [Parameter]
        public Guid OwnerId { get; set; }
        public List<Pet> PetsToGet { get; set; } = default!;

        protected override async Task OnInitializedAsync()
        {
            PetsToGet = (await PetOwnerDataService.GetPetsByOwnerId(OwnerId)).ToList();
        }

        protected void NavigateToPetAppointmentsPage(Guid petId)
        {
            NavigationManager.NavigateTo($"/owner/{OwnerId}/pet/{petId}/appointments");

        }

        protected void NavigateBack()
        {
            NavigationManager.NavigateTo($"/owner/{OwnerId}");
        }
    }
}
