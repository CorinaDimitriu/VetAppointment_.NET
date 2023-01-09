using System.Net;
using System.Text;
using System.Text.Json;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;

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

        public async Task<Treatment> GetTreatmentById(Guid id)
        {
            return await JsonSerializer.DeserializeAsync<Treatment>(
                await httpClient.GetStreamAsync($"{ApiURL}/{id}"),
                new JsonSerializerOptions()
                { PropertyNameCaseInsensitive = true });
        }

        public async Task<string> AddTreatment(TreatmentModel treatment, string jwt)
        {
            var options = new JsonSerializerOptions() { PropertyNameCaseInsensitive = true };
            var json = JsonSerializer.Serialize(treatment);

            var response = await httpClient.PostAsync
                    (ApiURL, new StringContent(json, Encoding.UTF8, "application/json"));
            //response.EnsureSuccessStatusCode();
            if (!response.IsSuccessStatusCode)
                return "Unauthorized";
            return response.Content.ToString();
        }

        public async Task<string> UpdateTreatmentById(Guid treatmentId, TreatmentModel treatment, string jwt)
        {
            var ApiURLTreatment = $"{ApiURL}/{{{treatmentId}}}";
            var json = JsonSerializer.Serialize(treatment);
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", jwt);
            var response = await httpClient.PutAsync
                    (ApiURLTreatment, new StringContent(json, UnicodeEncoding.UTF8, "application/json"));
            //response.EnsureSuccessStatusCode();
            if (!response.IsSuccessStatusCode)
                return "Unauthorized";
            return response.Content.ToString();
        }

        public async Task<string> DeleteTreatmentById(Guid treatmentId, string jwt)
        {
            var ApiURLTreatment = $"{ApiURL}/{{{treatmentId}}}";
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", jwt);
            var response = await httpClient.DeleteAsync(ApiURLTreatment);
            //response.EnsureSuccessStatusCode();
            if (!response.IsSuccessStatusCode)
                return "Unauthorized";
            return response.Content.ToString();
        }

        public async Task<IEnumerable<PrescribedDrug>> GetPrescribedDrugsByTreatmentId(Guid treatmentId)
        {
            var ApiURLTreatment = $"{ApiURL}/{{{treatmentId}}}/prescribeddrugs";
            return await JsonSerializer.DeserializeAsync<IEnumerable<PrescribedDrug>>(
                await httpClient.GetStreamAsync(ApiURLTreatment),
                new JsonSerializerOptions()
                { PropertyNameCaseInsensitive = true });
        }

        public async Task<string> AddPrescribedDrugsToTreatment(Guid treatmentId, List<PrescribedDrug> drugs, string jwt)
        {
            var ApiURLTreatment = $"{ApiURL}/{{{treatmentId}}}/prescribeddrugs";
            var json = JsonSerializer.Serialize(drugs);
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", jwt);
            var response = await httpClient.PostAsync(ApiURLTreatment,
                new StringContent(json, Encoding.UTF8, "application/json"));
            //response.EnsureSuccessStatusCode();
            if (response.StatusCode.Equals(HttpStatusCode.Forbidden) 
                || response.StatusCode.Equals(HttpStatusCode.Unauthorized))
            {
                return "Unauthorized";
            }
            if (response.StatusCode.Equals(HttpStatusCode.BadRequest))
            {
                return "Not right quantity";
            }
            return response.Content.ToString();
        }

        public async Task<string> DeletePrescribedDrugById(Guid treatmentId, Guid drugId, string jwt)
        {
            var ApiURLTreatment = $"{ApiURL}/{{{treatmentId}}}/prescribeddrug/{{{drugId}}}";
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", jwt);
            var response = await httpClient.DeleteAsync(ApiURLTreatment);
            //response.EnsureSuccessStatusCode();
            if (!response.IsSuccessStatusCode)
                return "Unauthorized";
            return response.Content.ToString();
        }

        public async Task<string> UpdatePrescribedDrugById(Guid treatmentId, Guid drugId, PrescribedDrugToUpdateModel drugModel, string jwt)
        {
            var ApiURLTreatment = $"{ApiURL}/{{{treatmentId}}}/prescribeddrug/{{{drugId}}}";
            var drug = new PrescribedDrug()
            {
                Quantity=drugModel.Quantity,
                TotalCost=drugModel.TotalCost,
                DrugToPrescribeId = Guid.Parse(drugModel.DrugId[0])
            };
            var json = JsonSerializer.Serialize(drug);
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", jwt);
            var response = await httpClient.PutAsync
                    (ApiURLTreatment, new StringContent(json, UnicodeEncoding.UTF8, "application/json"));
            //response.EnsureSuccessStatusCode();
            if (!response.IsSuccessStatusCode)
                return "Unauthorized";
            return response.Content.ToString();
        }
    }
}
