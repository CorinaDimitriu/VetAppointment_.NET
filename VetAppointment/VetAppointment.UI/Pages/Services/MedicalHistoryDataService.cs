using System.Text.Json;
using VetAppointment.Shared.Domain;

#nullable disable
namespace VetAppointment.UI.Pages.Services
{
    public class MedicalHistoryDataService : IMedicalHistoryDataService
    {
        private const string version = "v1";
        private const string ApiURL = $"https://localhost:7112/{version}/api/medicalhistories";
        private readonly HttpClient httpClient;

        public MedicalHistoryDataService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }

        public async Task<IEnumerable<MedicalHistory>> GetAllMedicalHistories()
        {
            var options = new JsonSerializerOptions() { PropertyNameCaseInsensitive = true };
            return await JsonSerializer.DeserializeAsync<IEnumerable<MedicalHistory>>
                (await httpClient.GetStreamAsync(ApiURL), options);
        }

        public async Task<MedicalHistory> GetMedicalHistoryByClinicId(Guid clinicId)
        {
            var ApiURLClinic = $"{ApiURL}/{{{clinicId}}}/medicalhistories";
            return await JsonSerializer.DeserializeAsync<MedicalHistory>(
                await httpClient.GetStreamAsync(ApiURLClinic),
                new JsonSerializerOptions()
                { PropertyNameCaseInsensitive = true });
        }
    }
}
