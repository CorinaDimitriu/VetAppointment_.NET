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

        public async Task<TreatmentModel> AddTreatment(TreatmentModel treatment)
        {
            var options = new JsonSerializerOptions() { PropertyNameCaseInsensitive = true };
            var json = JsonSerializer.Serialize(treatment);
            var response = await httpClient.PostAsync
                    (ApiURL, new StringContent(json, Encoding.UTF8, "application/json"));
            response.EnsureSuccessStatusCode();
            return await JsonSerializer.DeserializeAsync<TreatmentModel>(response.Content.ReadAsStream(), options);
        }

        public async Task<string> UpdateTreatmentById(Guid treatmentId, TreatmentModel treatment)
        {
            var ApiURLTreatment = $"{ApiURL}/{{{treatmentId}}}";
            var json = JsonSerializer.Serialize(treatment);
            var response = await httpClient.PutAsync
                    (ApiURLTreatment, new StringContent(json, UnicodeEncoding.UTF8, "application/json"));
            response.EnsureSuccessStatusCode();
            return response.Content.ToString();
        }

        public async Task<string> DeleteTreatmentById(Guid treatmentId)
        {
            var ApiURLTreatment = $"{ApiURL}/{{{treatmentId}}}";
            var response = await httpClient.DeleteAsync(ApiURLTreatment);
            response.EnsureSuccessStatusCode();
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

        public async Task<string> AddPrescribedDrugsToTreatment(Guid treatmentId, List<PrescribedDrug> drugs)
        {
            var ApiURLTreatment = $"{ApiURL}/{{{treatmentId}}}/prescribeddrugs";
            var json = JsonSerializer.Serialize(drugs);
            var response = await httpClient.PostAsync(ApiURLTreatment,
                new StringContent(json, Encoding.UTF8, "application/json"));
            response.EnsureSuccessStatusCode();
            return response.Content.ToString();
        }

        public async Task<string> DeletePrescribedDrugById(Guid treatmentId, Guid drugId)
        {
            var ApiURLTreatment = $"{ApiURL}/{{{treatmentId}}}/prescribeddrug/{{{drugId}}}";
            var response = await httpClient.DeleteAsync(ApiURLTreatment);
            response.EnsureSuccessStatusCode();
            return response.Content.ToString();
        }

        public async Task<string> UpdatePrescribedDrugById(Guid treatmentId, Guid drugId, PrescribedDrugToUpdateModel drugModel)
        {
            var ApiURLTreatment = $"{ApiURL}/{{{treatmentId}}}/prescribeddrug/{{{drugId}}}";
            var drug = new PrescribedDrug()
            {
                Quantity=drugModel.Quantity,
                TotalCost=drugModel.TotalCost,
                DrugToPrescribeId = Guid.Parse(drugModel.DrugId[0])
            };
            var json = JsonSerializer.Serialize(drug);
            var response = await httpClient.PutAsync
                    (ApiURLTreatment, new StringContent(json, UnicodeEncoding.UTF8, "application/json"));
            response.EnsureSuccessStatusCode();
            return response.Content.ToString();
        }
    }
}
