using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain;
using VetAppointment.Shared.Domain.Enums;
using VetAppointment.UI.Pages.Models;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages.PetPages
{
    public partial class PetEditPage : ComponentBase
    {
        [Inject]
        public IPetDataService PetDataService { get; set; }
        [Inject]
        public IVetClinicDataService VetClinicDataService { get; set; }
        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }
        [Parameter]
        public Guid PetId { get; set; }
        [Parameter]
        public Guid ClinicId { get; set; }
        public PetToUpdateModel PetToUpdate { get; set; } = new();
        public PetToUpdateModel PetOld { get; set; } = new();
        public List<string> Races { get; set; } =
            Enum.GetNames(typeof(AnimalRace)).Select(s => s.ToString()).ToList();

        protected override async Task OnInitializedAsync()
        {
            Pet pet = await PetDataService.GetPetById(PetId);
            PetToUpdate = new PetToUpdateModel()
            {
                Name = pet.Name,
                Birthdate = DateTime.Parse(pet.Birthdate),
                Race = new string[1] { pet.Race },
                Gender = pet.Gender,
            };
            PetOld = new PetToUpdateModel()
            {
                Name = PetToUpdate.Name,
                Birthdate = PetToUpdate.Birthdate,
                Race = PetToUpdate.Race,
                Gender = PetToUpdate.Gender,
            };
        }

        protected async Task UpdatePetFromClinic()
        {
            await VetClinicDataService.UpdatePetById(ClinicId, PetId, PetToUpdate);
            PetOld = new PetToUpdateModel()
            {
                Name = PetToUpdate.Name,
                Birthdate = PetToUpdate.Birthdate,
                Race = PetToUpdate.Race,
                Gender = PetToUpdate.Gender,
            };
            await JSRuntime.InvokeVoidAsync("Alert", "The pet has been successfully updated!");
        }

        protected void NavigateBack()
        {
            NavigationManager.NavigateTo($"/clinic/{ClinicId}/pets");
        }
    }
}
