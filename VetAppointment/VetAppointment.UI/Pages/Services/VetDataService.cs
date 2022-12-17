using System.Text.Json;
using VetAppointment.Shared.Domain;

#nullable disable
namespace VetAppointment.UI.Pages.Services
{
    public class VetDataService : IVetDataService
    {
        private const string ApiURL = "https://localhost:7112/v1/api/vets";
        private readonly HttpClient httpClient;

        public VetDataService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }
        public async Task<IEnumerable<Vet>> GetAllVets()
        {
            var options = new JsonSerializerOptions() { PropertyNameCaseInsensitive = true };
            return await JsonSerializer.DeserializeAsync<IEnumerable<Vet>>
                (await httpClient.GetStreamAsync(ApiURL), options);
        }
    }
}
