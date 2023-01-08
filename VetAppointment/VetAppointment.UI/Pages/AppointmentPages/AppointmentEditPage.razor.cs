using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages.AppointmentPages
{
    public partial class AppointmentEditPage : ComponentBase
    {
        [Inject]
        public IVetClinicDataService VetClinicDataService { get; set; }
        [Inject]
        public IAppointmentDataService AppointmentDataService { get; set; }
        [Inject]
        public ITreatmentDataService TreatmentDataService { get; set; }
        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }
        [Parameter]
        public Guid ClinicId { get; set; }
        [Parameter]
        public Guid AppointmentId { get; set; }
        public AppointmentModel AppointmentToUpdate { get; set; } = new();
        public AppointmentModel AppointmentOld { get; set; } = new();
        public List<string> VetIds { get; set; } = default!;
        public List<string> PetIds { get; set; } = default!;
        public List<string> TreatmentIds { get; set; } = default!;

        protected override async Task OnInitializedAsync()
        {
            List<Vet> vets = (await VetClinicDataService.GetVetsByClinicId(ClinicId)).ToList();
            VetIds = new();
            vets.ForEach(v => VetIds.Add(v.Id.ToString()));

            List<Pet> pets = (await VetClinicDataService.GetPetsByClinicId(ClinicId)).ToList();
            PetIds = new();
            pets.ForEach(p => PetIds.Add(p.Id.ToString()));

            List<Treatment> treatments = (await TreatmentDataService.GetAllTreatments()).ToList();
            TreatmentIds = new();
            treatments.ForEach(t => TreatmentIds.Add(t.Id.ToString()));

            Appointment appointment = await AppointmentDataService.GetAppointmentById(AppointmentId);
            AppointmentOld = new AppointmentModel
            {
                VetId = new string[1] { appointment.VetId.ToString() },
                PetId = new string[1] { appointment.PetId.ToString() },
                TreatmentId = new string[1] { appointment.TreatmentId.ToString() },
                EstimatedDurationInMinutes = appointment.EstimatedDurationInMinutes,
                ScheduledDate = DateTime.Parse(appointment.ScheduledDate)
            };
            AppointmentToUpdate = new AppointmentModel
            {
                VetId = AppointmentOld.VetId,
                PetId = AppointmentOld.PetId,
                TreatmentId = AppointmentOld.TreatmentId,
                EstimatedDurationInMinutes = AppointmentOld.EstimatedDurationInMinutes,
                ScheduledDate = AppointmentOld.ScheduledDate
            };
        }

        protected async Task UpdateAppointment()
        {
            await AppointmentDataService.UpdateAppointmentById(AppointmentId, AppointmentToUpdate);
            AppointmentOld = new AppointmentModel
            {
                VetId = AppointmentToUpdate.VetId,
                PetId = AppointmentToUpdate.PetId,
                TreatmentId = AppointmentToUpdate.TreatmentId,
                EstimatedDurationInMinutes = AppointmentToUpdate.EstimatedDurationInMinutes,
                ScheduledDate = AppointmentToUpdate.ScheduledDate
            };
            await JSRuntime.InvokeVoidAsync("Alert", "The appointment has been successfully updated!");
        }

        protected void NavigateBack()
        {
            NavigationManager.NavigateTo($"/clinic/{ClinicId}/appointments");
        }
    }
}
