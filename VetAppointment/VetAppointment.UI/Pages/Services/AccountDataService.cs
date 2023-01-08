using System.Text.Json;
using System.Text;
using VetAppointment.UI.Pages.Models;
using VetAppointment.Shared.Domain;

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
            var accountReal = new Account()
            {
                Username = account.Username,
                Password = account.Password,
                Role = "Unspecified"
            };
            var json = JsonSerializer.Serialize(accountReal);
            var response = await httpClient.PostAsync
                    (ApiURL, new StringContent(json, Encoding.UTF8, "application/json"));
            var jsonToken = response.Content.ReadAsStringAsync().Result;
            var bearer = jsonToken.Split("\",")[0];
            response.EnsureSuccessStatusCode();
            return bearer;
        }

        public async Task<Account> CreateAccount(CreateAccountModel account)
        {
            var accountReal = new Account()
            {
                Username = account.Username,
                Password = account.Password,
                Role = account.Role[0]
            };

            var options = new JsonSerializerOptions() { PropertyNameCaseInsensitive = true };
            var json = JsonSerializer.Serialize(accountReal);
            var response = await httpClient.PostAsync
                    (ApiURL + "/accountsCreate", new StringContent(json, Encoding.UTF8, "application/json"));
            response.EnsureSuccessStatusCode();
            return await JsonSerializer.DeserializeAsync<Account>(response.Content.ReadAsStream(), options);
        }

        public async Task Logout()
        {
            var json = JsonSerializer.Serialize("nothing");
            var response = await httpClient.PostAsync
                   (ApiURL + "/accountsLogout", new StringContent(json, Encoding.UTF8, "application/json"));
        }
    }
}
