using System.Text;
using System.Text.Json;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;

#nullable disable
namespace VetAppointment.UI.Pages.Services
{
    public class AppointmentDataService : IAppointmentDataService
    {
        private const string version = "v1";
        private const string ApiURL = $"https://localhost:7112/{version}/api/appointments";
        private readonly HttpClient httpClient;

        public AppointmentDataService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }
        public async Task<IEnumerable<Appointment>> GetAllAppointments()
        {
            var options = new JsonSerializerOptions() { PropertyNameCaseInsensitive = true };
            return await JsonSerializer.DeserializeAsync<IEnumerable<Appointment>>
                (await httpClient.GetStreamAsync(ApiURL), options);
        }

        public async Task<Appointment> GetAppointmentById(Guid id)
        {
            return await JsonSerializer.DeserializeAsync<Appointment>(
                await httpClient.GetStreamAsync($"{ApiURL}/{id}"),
                new JsonSerializerOptions()
                { PropertyNameCaseInsensitive = true });
        }

        public async Task<Appointment> AddAppointment(Appointment appointment)
        {
            var options = new JsonSerializerOptions() { PropertyNameCaseInsensitive = true };
            var json = JsonSerializer.Serialize(appointment);
            var response = await httpClient.PostAsync
                (ApiURL, new StringContent(json, UnicodeEncoding.UTF8, "application/json"));
            response.EnsureSuccessStatusCode();
            return await JsonSerializer.DeserializeAsync<Appointment>(response.Content.ReadAsStream(), options);
        }

        public async Task<string> DeleteAppointmentById(Guid appointmentId)
        {
            var ApiURLAppointment = $"{ApiURL}/{{{appointmentId}}}";
            var response = await httpClient.DeleteAsync(ApiURLAppointment);
            response.EnsureSuccessStatusCode();
            return response.Content.ToString();
        }

        public async Task<string> UpdateAppointmentById(Guid appointmentId, AppointmentModel appointment)
        {
            var ApiURLAppointment = $"{ApiURL}/{appointmentId}";
            var appointmentDto = new Appointment
            {
                VetId = Guid.Parse(appointment.VetId[0]),
                PetId = Guid.Parse(appointment.PetId[0]),
                TreatmentId = Guid.Parse(appointment.TreatmentId[0]),
                EstimatedDurationInMinutes = appointment.EstimatedDurationInMinutes,
                ScheduledDate = appointment.ScheduledDate.ToString()
            };
            var json = JsonSerializer.Serialize(appointmentDto);
            var response = await httpClient.PutAsync
                    (ApiURLAppointment, new StringContent(json, UnicodeEncoding.UTF8, "application/json"));
            response.EnsureSuccessStatusCode();
            return response.Content.ToString();
        }
    }
}
