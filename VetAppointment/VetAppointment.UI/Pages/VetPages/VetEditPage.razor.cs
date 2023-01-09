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
        [Inject]
        public NavigationManager NavigationManager { get; set; }
        [Parameter]
        public Guid VetId { get; set; }
        [Parameter]
        public Guid ClinicId { get; set; }
        public VetModel VetToUpdate { get; set; } = new();
        public VetModel VetOld { get; set; } = new();
        public List<string> Specialisations { get; set; } =
            Enum.GetNames(typeof(VetSpecialisation)).Select(s => s.ToString()).ToList();

        protected override async Task OnInitializedAsync()
        {
            Vet vet = await VetDataService.GetVetById(VetId);
            VetToUpdate = new VetModel()
            {
                Name = vet.Name,
                Surname = vet.Surname,
                Birthdate = DateTime.Parse(vet.Birthdate),
                Gender = vet.Gender,
                Email = vet.Email,
                Phone = vet.Phone,
                Specialisation = new string[1] { vet.Specialisation }
            };
            VetOld = new VetModel()
            {
                Name = VetToUpdate.Name,
                Surname = VetToUpdate.Surname,
                Birthdate = VetToUpdate.Birthdate,
                Gender = VetToUpdate.Gender,
                Email = VetToUpdate.Email,
                Phone = VetToUpdate.Phone,
                Specialisation = VetToUpdate.Specialisation
            };
        }

        protected async Task UpdateVetFromClinic()
        {
            var jwt = await JSRuntime.InvokeAsync<string>("ReadCookie", "JWT");
            var bearer = await VetClinicDataService.UpdateVetById(ClinicId, VetId, VetToUpdate, jwt);
            if (bearer == "Unauthorized")
            {
                await JSRuntime.InvokeVoidAsync("Alert", "Insufficient privileges!");
            }
            else
            {
                VetOld = new VetModel()
                {
                    Name = VetToUpdate.Name,
                    Surname = VetToUpdate.Surname,
                    Birthdate = VetToUpdate.Birthdate,
                    Gender = VetToUpdate.Gender,
                    Email = VetToUpdate.Email,
                    Phone = VetToUpdate.Phone,
                    Specialisation = VetToUpdate.Specialisation
                };
                await JSRuntime.InvokeVoidAsync("Alert", "The vet has been successfully updated!");
            }
        }

        protected void NavigateToAppointments()
        {
            NavigationManager.NavigateTo($"/clinic/{ClinicId}/vet/{VetId}/appointments");
        }

        protected void NavigateBack()
        {
            NavigationManager.NavigateTo($"/clinic/{ClinicId}/vets");
        }
    }
}
