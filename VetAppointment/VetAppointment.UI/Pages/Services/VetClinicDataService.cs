using System.Text;
using System.Text.Json;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;

#nullable disable
namespace VetAppointment.UI.Pages.Services
{
    public class VetClinicDataService : IVetClinicDataService
    {
        private const string ApiURL = "https://localhost:7112/v1/api/VetClinics";
        private readonly HttpClient httpClient;

        public VetClinicDataService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }

        public async Task<IEnumerable<VetClinic>> GetAllClinics()
        {
            return await JsonSerializer.DeserializeAsync<IEnumerable<VetClinic>>(
                await httpClient.GetStreamAsync(ApiURL),
                new JsonSerializerOptions()
                { PropertyNameCaseInsensitive = true });
        }

        public async Task<VetClinic> AddClinic(VetClinic clinic)
        {
            var options = new JsonSerializerOptions() { PropertyNameCaseInsensitive = true };
            var json = JsonSerializer.Serialize(clinic);
            var response = await httpClient.PostAsync
                    (ApiURL, new StringContent(json, Encoding.UTF8, "application/json"));
            response.EnsureSuccessStatusCode();
            return await JsonSerializer.DeserializeAsync<VetClinic>(response.Content.ReadAsStream(), options);
        }

        public async Task<string> AddVetToClinic(Guid clinicId, ModelVet vet)
        {
            var ApiURLClinic = $"{ApiURL}/{{{clinicId}}}/vet";
            var vetDto = new Vet()
            {
                Name = vet.Name,
                Surname = vet.Surname,
                Birthdate = vet.Birthdate.ToString(),
                Gender = vet.Gender,
                Email = vet.Email,
                Phone = vet.Phone,
                Specialisation = vet.Specialisation[0]
            };
            var json = JsonSerializer.Serialize(vetDto);
            var response = await httpClient.PostAsync
                    (ApiURLClinic, new StringContent(json, Encoding.UTF8, "application/json"));
            response.EnsureSuccessStatusCode();
            return response.Content.ToString();
        }

        public async Task<VetClinic> GetClinicById(Guid id)
        {
            return await JsonSerializer.DeserializeAsync<VetClinic>(
                await httpClient.GetStreamAsync(ApiURL + "/" + id),
                new JsonSerializerOptions()
                { PropertyNameCaseInsensitive = true });
        }

        public async Task<string> UpdateClinic(Guid clinicId, ModelClinic clinic)
        {
            var ApiURLClinic = $"{ApiURL}/{{{clinicId}}}";
            var vetClinic = new VetClinic()
            {
                Name = clinic.Name,
                Address = clinic.Address,
                ContactPhone = clinic.ContactPhone,
                ContactEmail = clinic.ContactEmail,
                NumberOfPlaces = clinic.NumberOfPlaces
            };
            var json = JsonSerializer.Serialize(vetClinic);
            var response = await httpClient.PutAsync
                    (ApiURLClinic, new StringContent(json, UnicodeEncoding.UTF8, "application/json"));
            response.EnsureSuccessStatusCode();
            return response.Content.ToString();
        }

        public async Task<string> DeleteClinicById(Guid clinicId)
        {
            var ApiURLClinic = $"{ApiURL}/{{{clinicId}}}";
            var response = await httpClient.DeleteAsync(ApiURLClinic);
            response.EnsureSuccessStatusCode();
            return response.Content.ToString();
        }

        public async Task<string> AddPetsToClinic(Guid clinicId, List<Pet> pets)
        {
            var ApiURLClinic = $"{ApiURL}/{{{clinicId}}}/pets";
            var json = JsonSerializer.Serialize(pets);
            var response = await httpClient.PostAsync(ApiURLClinic, 
                new StringContent(json, Encoding.UTF8, "application/json"));
            response.EnsureSuccessStatusCode();
            return response.Content.ToString();
        }

    }
}
