using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages.ClinicPages
{
    public partial class ClinicMedicalHistory : ComponentBase
    {
        [Inject]
        public IVetClinicDataService VetClinicDataService { get; set; }
        [Inject]
        public IAppointmentDataService AppointmentDataService { get; set; }
        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }
        [Parameter]
        public Guid ClinicId { get; set; }
        [Parameter]
        public Guid MedicalHistoryId { get; set; }
        public List<Appointment> MedicalHistories { get; set; } = default!;

        protected override async Task OnInitializedAsync()
        {
            List<Appointment> allAppointments = (await VetClinicDataService.GetAppointmentsByClinicId(ClinicId)).ToList();
            MedicalHistories = new();
            allAppointments.ForEach(a => { if (DateTime.Parse(a.ScheduledDate) <= DateTime.Now) MedicalHistories.Add(a); });
        }

        protected async Task DeleteAppointment(Guid appointmentId)
        {
            bool isDeleting = await JSRuntime.InvokeAsync<bool>("ConfirmDelete", "medical history", appointmentId);
            if (isDeleting)
            {
                await AppointmentDataService.DeleteAppointmentById(appointmentId);
                await JSRuntime.InvokeVoidAsync("Alert", "The medical history has been successfully deleted!");
                List<Appointment> allAppointments = (await VetClinicDataService.GetAppointmentsByClinicId(ClinicId)).ToList();
                MedicalHistories = new();
                allAppointments.ForEach(a => { if (DateTime.Parse(a.ScheduledDate) <= DateTime.Now) MedicalHistories.Add(a); });
            }
        }

        protected void NavigateBack()
        {
            NavigationManager.NavigateTo($"/clinic/{ClinicId}");
        }
    }
}
