using Blazored.SessionStorage;
using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain.Enums;
using VetAppointment.UI.Pages.Models;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages.Accounts
{
#nullable disable
    public partial class CreateAccountsOverview : ComponentBase
    {
        [Inject]
        public IAccountDataService AccountDataService { get; set; }

        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }

        public CreateAccountModel CreateAccount = new();

        public List<string> Roles { get; set; } =
            Enum.GetNames(typeof(Role)).Select(s => s.ToString()).ToList();

        protected async Task Create()
        {
            var jwt = await JSRuntime.InvokeAsync<string>("ReadCookie", "JWT");
            string response = await AccountDataService.CreateAccount(CreateAccount, jwt);
            if (response.Equals("Unauthorized"))
            {
                await JSRuntime.InvokeVoidAsync("Alert", "Insufficient privileges!");
            }
            else if (response.Equals("Password not valid."))
            {
                await JSRuntime.InvokeVoidAsync("Alert", "Password format is not valid!");
            }
            else if (response.Equals("User already exists"))
            {
                await JSRuntime.InvokeVoidAsync("Alert", "Username already exists!");
            }
            else
            {
                await JSRuntime.InvokeVoidAsync("Alert", "You have created account successfully!");
                NavigateBack();
            }
        }

        protected void NavigateBack()
        {
            NavigationManager.NavigateTo($"/accountsoverview");
        }
    }
}