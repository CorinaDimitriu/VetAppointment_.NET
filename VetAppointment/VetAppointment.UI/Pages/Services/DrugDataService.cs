using Microsoft.Extensions.Options;
using System.Text;
using System.Text.Json;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;

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

        public async Task<Drug> GetDrugById(Guid id)
        {
            return await JsonSerializer.DeserializeAsync<Drug>(
                await httpClient.GetStreamAsync($"{ApiURL}/{id}"),
                new JsonSerializerOptions()
                { PropertyNameCaseInsensitive = true });
        }

        public async Task<string> AddDrug(DrugModel drug, string jwt)
        {
            var options = new JsonSerializerOptions() { PropertyNameCaseInsensitive = true };
            var json = JsonSerializer.Serialize(drug);
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", jwt);
            var response = await httpClient.PostAsync
                    (ApiURL, new StringContent(json, Encoding.UTF8, "application/json"));
            //response.EnsureSuccessStatusCode();
            if (!response.IsSuccessStatusCode)
                return "Unauthorized";
            return response.Content.ToString();
        }

        public async Task<string> UpdateDrugById(Guid drugId, DrugModel drug, string jwt)
        {
            var ApiURLDrug = $"{ApiURL}/{{{drugId}}}";
            var json = JsonSerializer.Serialize(drug);
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", jwt);
            var response = await httpClient.PutAsync
                    (ApiURLDrug, new StringContent(json, UnicodeEncoding.UTF8, "application/json"));
            //response.EnsureSuccessStatusCode();
            if (!response.IsSuccessStatusCode)
                return "Unauthorized";
            return response.Content.ToString();
        }

        public async Task<string> DeleteDrugById(Guid drugId, string jwt)
        {
            var ApiURLDrug = $"{ApiURL}/{{{drugId}}}";
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", jwt);
            var response = await httpClient.DeleteAsync(ApiURLDrug);
            //response.EnsureSuccessStatusCode();
            if (!response.IsSuccessStatusCode)
                return "Unauthorized";
            return response.Content.ToString();
        }
    }
}
