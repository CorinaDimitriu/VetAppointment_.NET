using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Services;

#nullable disable
namespace VetAppointment.UI.Pages.ClinicPages
{
    public partial class ClinicAppointments : ComponentBase
    {
        [Inject]
        public IVetClinicDataService VetClinicDataService { get; set; }
        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Parameter]
        public Guid ClinicId { get; set; }
        public List<Appointment> AppointmentsToGet { get; set; } = default!;

        protected override async Task OnInitializedAsync()
        {
            AppointmentsToGet = (await VetClinicDataService.GetAppointmentsByClinicId(ClinicId)).ToList();
        }
    }
}
