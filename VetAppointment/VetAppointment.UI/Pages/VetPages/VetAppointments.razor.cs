using Microsoft.AspNetCore.Components;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages.VetPages
{
    public partial class VetAppointments : ComponentBase
    {
        [Inject]
        public IVetClinicDataService VetClinicDataService { get; set; }
        [Inject]
        public IAppointmentDataService AppointmentDataService { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }
        [Parameter]
        public Guid ClinicId { get; set; }
        [Parameter]
        public Guid VetId { get; set; }
        public List<Appointment> AppointmentsToGet { get; set; } = default!;

        protected override async Task OnInitializedAsync()
        {
            List<Appointment> allAppointments = (await VetClinicDataService.GetAppointmentsByClinicId(ClinicId)).ToList();
            AppointmentsToGet = new();
            allAppointments.ForEach(a => { if (a.VetId == VetId && DateTime.Parse(a.ScheduledDate) > DateTime.Now) AppointmentsToGet.Add(a); });
        }

        protected void NavigateBack()
        {
            NavigationManager.NavigateTo($"/{ClinicId}/vet/{VetId}");
        }
    }
}
