using System.Text.Json;
using VetAppointment.Shared.Domain;

#nullable disable
namespace VetAppointment.UI.Pages.Services
{
    public class TreatmentDataService : ITreatmentDataService
    {
        private const string version = "v1";
        private const string ApiURL = $"https://localhost:7112/{version}/api/treatments";
        private readonly HttpClient httpClient;

        public TreatmentDataService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }
        public async Task<IEnumerable<Treatment>> GetAllTreatments()
        {
            var options = new JsonSerializerOptions() { PropertyNameCaseInsensitive = true };
            return await JsonSerializer.DeserializeAsync<IEnumerable<Treatment>>
                (await httpClient.GetStreamAsync(ApiURL), options);
        }
    }
}
