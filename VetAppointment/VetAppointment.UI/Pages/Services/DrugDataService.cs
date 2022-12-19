using System.Text;
using System.Text.Json;
using VetAppointment.Shared.Domain;

#nullable disable
namespace VetAppointment.UI.Pages.Services
{
    public class DrugDataService : IDrugDataService
    {
        private const string version = "v1";
        private const string ApiURL = $"https://localhost:7112/{version}/api/drugs";
        private readonly HttpClient httpClient;

        public DrugDataService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }
        public async Task<IEnumerable<Drug>> GetAllDrugs()
        {
            var options = new JsonSerializerOptions() { PropertyNameCaseInsensitive = true };
            return await JsonSerializer.DeserializeAsync<IEnumerable<Drug>>
                (await httpClient.GetStreamAsync(ApiURL), options);
        }
    }
}
