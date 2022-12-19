using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain;
using VetAppointment.Shared.Domain.Enums;
using VetAppointment.UI.Pages.Models;
using VetAppointment.UI.Pages.Services;

#nullable disable
namespace VetAppointment.UI.Pages.VetPages
{
    public partial class VetEditPage : ComponentBase
    {
        [Inject]
        public IVetDataService VetDataService { get; set; }
        [Inject]
        public IVetClinicDataService VetClinicDataService { get; set; }
        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Parameter]
        public Guid VetId { get; set; }
        [Parameter]
        public Guid ClinicId { get; set; }
        public VetToUpdateModel VetToUpdate { get; set; } = new();
        public List<string> Specialisations { get; set; } =
            Enum.GetNames(typeof(VetSpecialisation)).Select(s => s.ToString()).ToList();

        protected override async Task OnInitializedAsync()
        {
            Vet vet = await VetDataService.GetVetById(VetId);
            VetToUpdate = new VetToUpdateModel()
            {
                Id = vet.Id.ToString(),
                Name = vet.Name,
                Surname = vet.Surname,
                Birthdate = DateTime.Parse(vet.Birthdate),
                Gender= vet.Gender,
                Email = vet.Email,
                Phone = vet.Phone,
                ClinicId = ClinicId.ToString(),
                Specialisation = new string[1] { vet.Specialisation }
            };
        }

        protected async Task UpdateVetFromClinic()
        {
            await VetClinicDataService.UpdateVetById(VetId, VetToUpdate);
            await JSRuntime.InvokeVoidAsync("Alert", "The vet has been updated successfully!");
        }
    }
}
