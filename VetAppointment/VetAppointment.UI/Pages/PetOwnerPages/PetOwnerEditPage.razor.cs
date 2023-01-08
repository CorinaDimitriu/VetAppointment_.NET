using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages.PetOwnerPages
{
    public partial class PetOwnerEditPage : ComponentBase
    {
        [Inject]
        public IPetOwnerDataService PetOwnerDataService { get; set; }
        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }
        [Parameter]
        public Guid OwnerId { get; set; }
        public PetOwnerModel PetOwnerToUpdate { get; set; } = new();
        public PetOwnerModel PetOwnerOld { get; set; } = new();

        protected override async Task OnInitializedAsync()
        {
            PetOwner owner = await PetOwnerDataService.GetPetOwnerById(OwnerId);
            PetOwnerToUpdate = new PetOwnerModel()
            {
                Name = owner.Name,
                Surname = owner.Surname,
                Birthdate = DateTime.Parse(owner.Birthdate),
                Gender = owner.Gender,
                Address = owner.Address,
                Email = owner.Email,
                Phone = owner.Phone
            };
            PetOwnerOld = new PetOwnerModel()
            {
                Name = PetOwnerToUpdate.Name,
                Surname = PetOwnerToUpdate.Surname,
                Birthdate = PetOwnerToUpdate.Birthdate,
                Gender = PetOwnerToUpdate.Gender,
                Address = PetOwnerToUpdate.Address,
                Email = PetOwnerToUpdate.Email,
                Phone = PetOwnerToUpdate.Phone
            };
        }

        protected async Task UpdatePetOwner()
        {
            await PetOwnerDataService.UpdatePetOwnerById(OwnerId, PetOwnerToUpdate);
            PetOwnerOld = new PetOwnerModel()
            {
                Name = PetOwnerToUpdate.Name,
                Surname = PetOwnerToUpdate.Surname,
                Birthdate = PetOwnerToUpdate.Birthdate,
                Gender = PetOwnerToUpdate.Gender,
                Address = PetOwnerToUpdate.Address,
                Email = PetOwnerToUpdate.Email,
                Phone = PetOwnerToUpdate.Phone
            };
            await JSRuntime.InvokeVoidAsync("Alert", "The pet owner has been successfully updated!");
        }

        protected void NavigateToPets()
        {
            NavigationManager.NavigateTo($"/owner/{OwnerId}/pets");
        }

        protected void NavigateBack()
        {
            NavigationManager.NavigateTo($"/petownersoverview");
        }
    }
}
