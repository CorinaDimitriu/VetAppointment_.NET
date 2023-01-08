using Microsoft.AspNetCore.Components;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages.PetOwnerPages
{
    public partial class PetOwnerPetAppointments : ComponentBase
    {
        [Inject]
        public IAppointmentDataService AppointmentDataService { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }
        [Parameter]
        public Guid OwnerId { get; set; }
        [Parameter]
        public Guid PetId { get; set; }
        public List<Appointment> AppointmentsToGet { get; set; } = default!;

        protected override async Task OnInitializedAsync()
        {
            List<Appointment> allAppointments = (await AppointmentDataService.GetAllAppointments()).ToList();
            AppointmentsToGet = new();
            allAppointments.ForEach(a => { if (a.PetId == PetId && DateTime.Parse(a.ScheduledDate) > DateTime.Now) AppointmentsToGet.Add(a); });
        }

        protected void NavigateBack()
        {
            NavigationManager.NavigateTo($"/owner/{OwnerId}/pets");
        }
    }
}
