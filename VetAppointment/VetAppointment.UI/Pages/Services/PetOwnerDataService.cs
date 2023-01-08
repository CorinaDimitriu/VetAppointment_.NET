using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;

#nullable disable
namespace VetAppointment.UI.Pages.Services
{
    public class PetOwnerDataService : IPetOwnerDataService
    {
        private const string version = "v1";
        private const string ApiURL = $"https://localhost:7112/{version}/api/petOwners";
        private readonly HttpClient httpClient;

        public PetOwnerDataService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }
        public async Task<IEnumerable<PetOwner>> GetAllPetOwners()
        {
            return await JsonSerializer.DeserializeAsync<IEnumerable<PetOwner>>(await httpClient.GetStreamAsync(ApiURL),
                new JsonSerializerOptions() { PropertyNameCaseInsensitive = true });
        }

        public async Task<PetOwner> GetPetOwnerById(Guid id)
        {
            return await JsonSerializer.DeserializeAsync<PetOwner>(
                await httpClient.GetStreamAsync($"{ApiURL}/{id}"),
                new JsonSerializerOptions()
                { PropertyNameCaseInsensitive = true });
        }

        public async Task<PetOwner> AddPetOwner(PetOwner petOwner)
        {
            var options = new JsonSerializerOptions() { PropertyNameCaseInsensitive = true };
            var json = JsonSerializer.Serialize(petOwner);
            var response = await httpClient.PostAsync
                (ApiURL, new StringContent(json, Encoding.UTF8, "application/json"));
            response.EnsureSuccessStatusCode();
            return await JsonSerializer.DeserializeAsync<PetOwner>(response.Content.ReadAsStream(), options);
        }

        public async Task<string> UpdatePetOwnerById(Guid ownerId, PetOwnerModel owner)
        {
            var ApiURLOwner = $"{ApiURL}/{{{ownerId}}}";
            var json = JsonSerializer.Serialize(owner);
            var response = await httpClient.PutAsync
                    (ApiURLOwner, new StringContent(json, UnicodeEncoding.UTF8, "application/json"));
            response.EnsureSuccessStatusCode();
            return response.Content.ToString();
        }

        public async Task<string> DeletePetOwnerById(Guid ownerId)
        {
            var ApiURLOwner = $"{ApiURL}/{{{ownerId}}}";
            var response = await httpClient.DeleteAsync(ApiURLOwner);
            response.EnsureSuccessStatusCode();
            return response.Content.ToString();
        }

        public async Task<IEnumerable<Pet>> GetPetsByOwnerId(Guid ownerId)
        {
            var ApiURLClinic = $"{ApiURL}/{{{ownerId}}}/pets";
            return await JsonSerializer.DeserializeAsync<IEnumerable<Pet>>(
                await httpClient.GetStreamAsync(ApiURLClinic),
                new JsonSerializerOptions()
                { PropertyNameCaseInsensitive = true });
        }
    }
}
