﻿using Blazored.SessionStorage;
using Microsoft.AspNetCore.Components;
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
        [Inject]
        ISessionStorageService storage { get; set; }

        public PetDataService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }

        public async Task<IEnumerable<Pet>> GetAllPets(string jwt)
        {
            Console.WriteLine(jwt);
            var options = new JsonSerializerOptions() { PropertyNameCaseInsensitive = true };
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", jwt);
            return await JsonSerializer.DeserializeAsync<IEnumerable<Pet>>
                (await httpClient.GetStreamAsync(ApiURL), options);
        }

        public async Task<Pet> GetPetById(Guid id)
        {
            return await JsonSerializer.DeserializeAsync<Pet>(
                await httpClient.GetStreamAsync($"{ApiURL}/{id}"),
                new JsonSerializerOptions()
                { PropertyNameCaseInsensitive = true });
        }
    }
}
