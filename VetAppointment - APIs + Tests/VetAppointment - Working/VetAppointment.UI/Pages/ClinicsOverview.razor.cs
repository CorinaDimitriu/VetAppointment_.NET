using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using System.Runtime.InteropServices;
using VetAppointment.Domain.Enums;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages
{
#nullable disable
    public partial class ClinicsOverview : ComponentBase
    {
        [Inject]
        public IVetClinicDataService VetClinicDataService { get; set; }

        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        public List<VetClinic> Clinics { get; set; } = default!;
        public VetClinic Clinic { get; set; } = default!;
        public VetClinic ClinicToGet { get; set; } = default!;
        public ModelClinic ClinicToUpdate { get; set; } = default!;
        public ModelPetsInClinic ModelPets { get; set; } = default!;
        public ModelVet Vet { get; set; } = default!;
        public string Id { get; set; } = default!;
        public string IdToDelete { get; set; } = default!;
        public bool IsCreating { get; set; } = false;
        public bool IsUpdating { get; set; } = false;
        public bool IsRetrieving { get; set; } = false;
        public bool IsDeleting { get; set; } = false;
        public bool IsVetBeingAdded { get; set; } = false;
        public bool ArePetsBeingAdded { get; set; } = false;

        public List<string> Specialisations { get; set; } = 
            Enum.GetNames(typeof(VetSpecialisation)).Select(s => s.ToString()).ToList();

        protected async override Task OnInitializedAsync()
        {
            Clinics = (await VetClinicDataService.GetAllClinics()).ToList();
        }

        protected async Task CreateClinic()
        {
            if (Clinic.Name != null && Clinic.ContactEmail != null && Clinic.ContactPhone != null
                && Clinic.Address != null && Clinic.NumberOfPlaces != 0)
                if (IsCreating)
                {
                    Clinic = await VetClinicDataService.AddClinic(Clinic);
                }
        }

        protected async Task UpdateClinic()
        {
            if (IsUpdating)
            {
                await VetClinicDataService.UpdateClinic(Guid.Parse(ClinicToUpdate.Id), ClinicToUpdate);
            }
        }

        protected void StartCreateClinic()
        {
            IsCreating = !IsCreating;
            if (IsCreating)
            {
                Clinic = new();
            }
            else
            {
                Clinic = default!;
            }
        }

        protected void StartUpdateClinic()
        {
            IsUpdating = !IsUpdating;
            if (IsUpdating)
            {
                ClinicToUpdate = new();
            }
            else
            {
                ClinicToUpdate = default!;
            }
        }

        protected async Task AddVetToClinic()
        {
            if (IsVetBeingAdded)
            {
                await VetClinicDataService.AddVetToClinic(Guid.Parse(Vet.ClinicId), Vet);
            }
        }

        protected void StartAddVetToClinic()
        {
            IsVetBeingAdded = !IsVetBeingAdded;
            if (IsVetBeingAdded)
            {
                Vet = new();
            }
            else
            {
                Vet = default!;
            }
        }

        protected async Task GetById()
        {
            if (IsRetrieving)
            {
                ClinicToGet = await VetClinicDataService.GetClinicById(Guid.Parse(Id));
            }
        }

        protected void ShowCreate()
        {
            Clinic = new();
            IsCreating = true;
        }

        protected void StartRetrieving()
        {
            IsRetrieving = !IsRetrieving;
            if (IsRetrieving)
            {
                Id = "";
            }
            else
            {
                Id = default!;
            }
        }

        protected async Task DeleteClinic()
        {
            if (IsDeleting)
            {
                await VetClinicDataService.DeleteClinicById(Guid.Parse(IdToDelete));
            }
        }

        protected void StartDeleteClinic()
        {
            IsDeleting = !IsDeleting;
            if (IsDeleting)
            {
                IdToDelete = "";
            }
            else
            {
                IdToDelete = default!;
            }
        }

        protected async Task AddPetsToClinic()
        {
            if (ArePetsBeingAdded)
            {
                for (int i = 0; i < 10; i++)
                    Console.WriteLine(ModelPets.Pets[i].Hidden);

                var pets = new List<Pet>();
                for (int i = 0; i < ModelPets.Count; i++)
                    pets.Add(new Pet()
                    {
                        Name = ModelPets.Pets[i].Name,
                        Birthdate = ModelPets.Pets[i].Birthdate,
                        Race = ModelPets.Pets[i].Race,
                        Gender = ModelPets.Pets[i].Gender
                    });
                await VetClinicDataService.AddPetsToClinic(Guid.Parse(ModelPets.ClinicId), pets);
            }
        }

        protected void StartAddPetsToClinic()
        {
            ArePetsBeingAdded = !ArePetsBeingAdded;
            if (ArePetsBeingAdded)
            {
                ModelPets = new()
                {
                    Pets = new List<ModelPet>(),
                    ClinicId = "",
                    Count = 1
                };
                for (int i = 0; i < 10; i++)
                {
                    ModelPets.Pets.Add(new ModelPet() { Hidden = true });
                }
                ModelPets.Pets[0].Hidden = false;
            }
            else
            {
                ModelPets = default!;
            }
        }

        protected async Task AddInputFields()
        {
            if (ModelPets.Count < 10)
            {
                ModelPets.Count++;
                ModelPets.Pets[ModelPets.Count - 1].Hidden = false;
            }
            await JSRuntime.InvokeVoidAsync("DynamicInputFields");
        }

        protected async Task RemoveInput()
        {
            if (ModelPets.Count > 1)
            {
                ModelPets.Pets[ModelPets.Count - 1] = new ModelPet() { Hidden = true };
                ModelPets.Count--;
            }
            await JSRuntime.InvokeVoidAsync("RemoveInputFields");
        }
    }
}