using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain;
using VetAppointment.Shared.Domain.Enums;
using VetAppointment.UI.Pages.Models;
using VetAppointment.UI.Pages.Services;

#nullable disable
namespace VetAppointment.UI.Pages.ClinicPages
{
    public partial class ClinicPets : ComponentBase
    {
        [Inject]
        public IVetClinicDataService VetClinicDataService { get; set; }

        [Inject]
        public IPetOwnerDataService PetOwnerDataService { get; set; }
        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }
        [Parameter]
        public Guid ClinicId { get; set; }
        public List<Pet> PetsToGet { get; set; } = default!;
        public PetsInClinicModel PetsInClinicModel { get; set; } = default!;
        public List<string> Races { get; set; } =
           Enum.GetNames(typeof(AnimalRace)).Select(s => s.ToString()).ToList();
        public List<string> PetOwnersIds { get; set; } = default!;

        protected override async Task OnInitializedAsync()
        {
            PetsToGet = (await VetClinicDataService.GetPetsByClinicId(ClinicId)).ToList();
            List<PetOwner>  owners = (await PetOwnerDataService.GetAllPetOwners()).ToList();
            PetOwnersIds = new();
            owners.ForEach(o => PetOwnersIds.Add(o.Id.ToString()));
            if (owners.Count == 0)
            {
                PetOwnersIds.Add("No pet owner available.");
            }

            PetsInClinicModel = new PetsInClinicModel()
            {
                Pets = new List<PetModel>(),
                Count = 1,
            };
            PetsInClinicModel.OwnerId[0] = PetOwnersIds[0];
            for (int i = 0; i < 10; i++)
            {
                PetsInClinicModel.Pets.Add(new PetModel() { Hidden = true });
            }
            PetsInClinicModel.Pets[0].Hidden = false;
        }

        protected async Task AddPetsToClinic()
        {
            var pets = new List<Pet>();
            for (int i = 0; i < PetsInClinicModel.Count; i++)
                pets.Add(new Pet()
                {
                    Name = PetsInClinicModel.Pets[i].Name,
                    Birthdate = PetsInClinicModel.Pets[i].Birthdate.ToString(),
                    Race = PetsInClinicModel.Pets[i].Race[0],
                    Gender = PetsInClinicModel.Pets[i].Gender
                });
            string response = await VetClinicDataService.AddPetsToClinic(ClinicId, Guid.Parse(PetsInClinicModel.OwnerId[0]), pets);
            if (response.Equals("Exceeded available number of places"))
            {
                await JSRuntime.InvokeVoidAsync("Alert", "The newly added pets exceed the available number of places.");
            }
            else
            {
                await JSRuntime.InvokeVoidAsync("Alert", "The pets have been successfully added!");
                PetsToGet = (await VetClinicDataService.GetPetsByClinicId(ClinicId)).ToList();

                PetsInClinicModel = new PetsInClinicModel()
                {
                    Pets = new List<PetModel>(),
                    Count = 1,
                };
                PetsInClinicModel.OwnerId[0] = PetOwnersIds[0];
                for (int i = 0; i < 10; i++)
                {
                    PetsInClinicModel.Pets.Add(new PetModel() { Hidden = true });
                }
                PetsInClinicModel.Pets[0].Hidden = false;
            }
        }

        protected async Task AddInputFields()
        {
            if (PetsInClinicModel.Count < 10)
            {
                PetsInClinicModel.Count++;
                PetsInClinicModel.Pets[PetsInClinicModel.Count - 1].Hidden = false;
            }
            await JSRuntime.InvokeVoidAsync("DynamicInputFields");
        }

        protected async Task RemoveInput()
        {
            if (PetsInClinicModel.Count > 1)
            {
                PetsInClinicModel.Pets[PetsInClinicModel.Count - 1] = new PetModel() { Hidden = true };
                PetsInClinicModel.Count--;
            }
            await JSRuntime.InvokeVoidAsync("RemoveInputFields");
        }

        protected async Task DeletePet(Guid petId)
        {
            bool isDeleting = await JSRuntime.InvokeAsync<bool>("ConfirmDelete", "pet", petId);
            if (isDeleting)
            {
                await VetClinicDataService.DeletePetById(new PetToDeleteModel() { IdToDeleteClinic = ClinicId.ToString(), IdToDeletePet = petId.ToString() });
                await JSRuntime.InvokeVoidAsync("Alert", "The pet has been successfully deleted!");
                PetsToGet = (await VetClinicDataService.GetPetsByClinicId(ClinicId)).ToList();
            }
        }

        protected void NavigateToEditPage(Guid petId)
        {
            NavigationManager.NavigateTo($"{ClinicId}/pet/{petId}");
        }

        protected void NavigateBack()
        {
            NavigationManager.NavigateTo($"/clinic/{ClinicId}");
        }
    }
}
