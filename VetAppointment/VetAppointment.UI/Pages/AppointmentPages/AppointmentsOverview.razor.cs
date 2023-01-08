using Microsoft.AspNetCore.Components;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Services;

#nullable disable
namespace VetAppointment.UI.Pages.AppointmentPages
{
    public partial class AppointmentsOverview : ComponentBase
    {
        [Inject]
        public IAppointmentDataService AppointmentDataService { get; set; }

        public List<Appointment> Appointments { get; set; } = default!;
        protected async override Task OnInitializedAsync()
        {
            Appointments = (await AppointmentDataService.GetAllAppointments()).ToList();
        }
    }
}
