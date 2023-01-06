using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;
using VetAppointment.UI.Pages.Services;

#nullable disable
namespace VetAppointment.UI.Pages.PetOwnersPages
{
    public partial class PetOwnersOverview : ComponentBase
    {
        [Inject]
        public IPetOwnerDataService PetOwnerDataService { get; set; }
        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }
        public List<PetOwner> PetOwnersToGet { get; set; } = default!;
        public PetOwnerModel PetOwner { get; set; } = new();

        protected async override Task OnInitializedAsync()
        {
            PetOwnersToGet = (await PetOwnerDataService.GetAllPetOwners()).ToList();
        }

        protected async Task AddPetOwner()
        {
            PetOwner owner = new()
            {
                Id = Guid.NewGuid(),
                Name = PetOwner.Name,
                Surname = PetOwner.Surname,
                Birthdate = PetOwner.Birthdate.ToString(),
                Gender = PetOwner.Gender,
                Address = PetOwner.Address,
                Email = PetOwner.Email,
                Phone = PetOwner.Phone
            };
            await PetOwnerDataService.AddPetOwner(owner);
            PetOwner = new();
            await JSRuntime.InvokeVoidAsync("Alert", "The pet owner has been successfully added!");
            PetOwnersToGet = (await PetOwnerDataService.GetAllPetOwners()).ToList();
        }

        //protected async Task DeletePetOwner(Guid ownerId)
        //{
        //    bool isDeleting = await JSRuntime.InvokeAsync<bool>("ConfirmDelete", "pet owner", ownerId);
        //    if (isDeleting)
        //    {
        //        await PetOwnerDataService.DeletePetOwnerById(ownerId);
        //        await JSRuntime.InvokeVoidAsync("Alert", "The pet owner has been successfully deleted!");
        //        PetOwnersToGet = (await PetOwnerDataService.GetAllPetOwners()).ToList();
        //    }
        //}

        //protected void NavigateToEditPage(Guid ownerId)
        //{
        //    NavigationManager.NavigateTo($"/owner/{ownerId}");
        //}
    }
}