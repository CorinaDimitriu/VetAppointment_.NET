using System.Text.Json;
using System.Text;
using VetAppointment.UI.Pages.Models;
using Blazored.SessionStorage;
using Microsoft.JSInterop;

namespace VetAppointment.UI.Pages.Services
{
#nullable disable
    public class AccountDataService : IAccountDataService
    {
        private const string ApiURL = "https://localhost:7112/v1/api/accounts";
        private readonly HttpClient httpClient;

        public AccountDataService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }

        public async Task<string> AddAccount(AccountModel account)
        {
            var options = new JsonSerializerOptions() { PropertyNameCaseInsensitive = true };
            var json = JsonSerializer.Serialize(account);
            var response = await httpClient.PostAsync
                    (ApiURL, new StringContent(json, Encoding.UTF8, "application/json"));
            var jsonToken = response.Content.ReadAsStringAsync().Result;
            var bearer = jsonToken.Split("\",")[0];
            response.EnsureSuccessStatusCode();
            return bearer;
        }
    }
}
