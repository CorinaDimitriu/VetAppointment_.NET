using System.Text;
using System.Text.Json;
using VetAppointment.Shared.Domain;

#nullable disable
namespace VetAppointment.UI.Pages.Services
{
    public class PrescribedDrugDataService : IPrescribedDrugDataService
    {
        private const string ApiURL = "https://localhost:7112/v1/api/prescribeddrugs";
        private readonly HttpClient httpClient;

        public PrescribedDrugDataService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }
        public async Task<IEnumerable<PrescribedDrug>> GetAllPrescribedDrugs()
        {
            var options = new JsonSerializerOptions() { PropertyNameCaseInsensitive = true };
            return await JsonSerializer.DeserializeAsync<IEnumerable<PrescribedDrug>>
                (await httpClient.GetStreamAsync(ApiURL), options);
        }
    }
}
