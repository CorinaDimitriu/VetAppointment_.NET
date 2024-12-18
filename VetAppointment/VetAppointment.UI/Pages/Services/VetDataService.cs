﻿using System.Text.Json;
using VetAppointment.Shared.Domain;

#nullable disable
namespace VetAppointment.UI.Pages.Services
{
    public class VetDataService : IVetDataService
    {
        private const string version = "v1";
        private const string ApiURL = $"https://localhost:7112/{version}/api/vets";
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

        public async Task<Vet> GetVetById(Guid id)
        {
            return await JsonSerializer.DeserializeAsync<Vet>(
                await httpClient.GetStreamAsync($"{ApiURL}/{id}"),
                new JsonSerializerOptions()
                { PropertyNameCaseInsensitive = true });
        }
    }
}
