using System.Text;
using System.Text.Json;
using VetAppointment.Shared.Domain;

#nullable disable
namespace VetAppointment.UI.Pages.Services
{
    public class PetDataService : IPetDataService
    {
        private const string version = "v1";
        private const string ApiURL = $"https://localhost:7112/{version}/api/pets";
        private readonly HttpClient httpClient;

        public PetDataService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }
        public async Task<IEnumerable<Pet>> GetAllPets()
        {
            var options = new JsonSerializerOptions() { PropertyNameCaseInsensitive = true };
            return await JsonSerializer.DeserializeAsync<IEnumerable<Pet>>
                (await httpClient.GetStreamAsync(ApiURL), options);
        }
    }
}
