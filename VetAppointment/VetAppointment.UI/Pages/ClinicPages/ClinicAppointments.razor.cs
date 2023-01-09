using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using Smart.Blazor;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;
using VetAppointment.UI.Pages.Services;
using static System.Runtime.InteropServices.JavaScript.JSType;

#nullable disable
namespace VetAppointment.UI.Pages.ClinicPages
{
    public partial class ClinicAppointments : ComponentBase
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
        public List<Appointment> AppointmentsToGet { get; set; } = default!;
        public AppointmentModel Appointment { get; set; } = new();
        public List<string> VetIds { get; set; } = default!;
        public List<string> PetIds { get; set; } = default!;
        public List<string> TreatmentIds { get; set; } = default!;

        protected override async Task OnInitializedAsync()
        {
            List<Appointment> allAppointments = (await VetClinicDataService.GetAppointmentsByClinicId(ClinicId)).ToList();
            AppointmentsToGet = new();
            allAppointments.ForEach(a => { if (DateTime.Parse(a.ScheduledDate) > DateTime.Now) AppointmentsToGet.Add(a); });

            List<Vet> vets = (await VetClinicDataService.GetVetsByClinicId(ClinicId)).ToList();
            VetIds = new();
            vets.ForEach(v => VetIds.Add(v.Id.ToString()));
            if (vets.Count == 0)
            {
                VetIds.Add("No vet available.");
            }
            Appointment.VetId[0] = VetIds[0];

            List<Pet> pets = (await VetClinicDataService.GetPetsByClinicId(ClinicId)).ToList();
            PetIds = new();
            pets.ForEach(p => PetIds.Add(p.Id.ToString()));
            if (pets.Count == 0)
            {
                PetIds.Add("No pet available.");
            }
            Appointment.PetId[0] = PetIds[0];

            List<Treatment> treatments = (await TreatmentDataService.GetAllTreatments()).ToList();
            TreatmentIds = new();
            treatments.ForEach(t => TreatmentIds.Add(t.Id.ToString()));
            if (treatments.Count == 0)
            {
                TreatmentIds.Add("No treatment available.");
            }
            Appointment.TreatmentId[0] = TreatmentIds[0];
        }

        protected async Task AddAppointment()
        {
            string response = await VetClinicDataService.AddAppointmentToClinic(ClinicId, Appointment);
            if (response.Equals("Vet is busy at this time"))
            {
                await JSRuntime.InvokeVoidAsync("Alert", "Vet is busy at the desired scheduled date!");
            }
            else
            {
                await JSRuntime.InvokeVoidAsync("Alert", "The appointment has been successfully added!");
                Appointment = new();
                Appointment.VetId[0] = VetIds[0];
                Appointment.PetId[0] = PetIds[0];
                Appointment.TreatmentId[0] = TreatmentIds[0];
                List<Appointment> allAppointments = (await VetClinicDataService.GetAppointmentsByClinicId(ClinicId)).ToList();
                AppointmentsToGet = new();
                allAppointments.ForEach(a => { if (DateTime.Parse(a.ScheduledDate) > DateTime.Now) AppointmentsToGet.Add(a); });
            }
        }

        protected async Task DeleteAppointment(Guid appointmentId)
        {
            bool isDeleting = await JSRuntime.InvokeAsync<bool>("ConfirmDelete", "appointment", appointmentId);
            if (isDeleting)
            {
                await AppointmentDataService.DeleteAppointmentById(appointmentId);
                await JSRuntime.InvokeVoidAsync("Alert", "The appointment has been successfully deleted!");
                AppointmentsToGet = (await VetClinicDataService.GetAppointmentsByClinicId(ClinicId)).ToList();
            }
        }

        protected void NavigateToEditPage(Guid appointmentId)
        {
            NavigationManager.NavigateTo($"/{ClinicId}/appointment/{appointmentId}");
        }

        protected void NavigateBack()
        {
            NavigationManager.NavigateTo($"/clinic/{ClinicId}");
        }
    }
}
