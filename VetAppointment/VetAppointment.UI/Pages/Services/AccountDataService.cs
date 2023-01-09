using System.Text.Json;
using System.Text;
using VetAppointment.UI.Pages.Models;
using VetAppointment.Shared.Domain;
using System.Net;

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
            if (jsonToken == "Incorrect credentials")
                return jsonToken;
            var bearer = jsonToken.Split("\",")[0];
            return bearer;
        }

        public async Task<string> CreateAccount(CreateAccountModel account, string jwt)
        {
            var accountReal = new Account()
            {
                Username = account.Username,
                Password = account.Password,
                Role = account.Role[0]
            };

            var json = JsonSerializer.Serialize(accountReal);
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", jwt);
            var response = await httpClient.PostAsync
                    (ApiURL + "/accountsCreate", new StringContent(json, Encoding.UTF8, "application/json"));
            if (response.StatusCode.Equals(HttpStatusCode.Forbidden))
            {
                return "Unauthorized";
            }
            return response.Content.ReadAsStringAsync().Result;
        }

        public async Task Logout()
        {
            var json = JsonSerializer.Serialize("nothing");
            var response = await httpClient.PostAsync
                   (ApiURL + "/accountsLogout", new StringContent(json, Encoding.UTF8, "application/json"));
        }
    }
}
