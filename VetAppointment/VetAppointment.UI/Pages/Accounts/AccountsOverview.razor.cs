using Blazored.SessionStorage;
using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain.Enums;
using VetAppointment.UI.Pages.Models;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages.Accounts
{
#nullable disable
    public partial class AccountsOverview : ComponentBase
    {
        [Inject]
        public IAccountDataService AccountDataService { get; set; }

        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }

        public AccountModel Account = new();

        public List<string> Roles { get; set; } =
            Enum.GetNames(typeof(Role)).Select(s => s.ToString()).ToList();
        protected async Task Login()
        {
            var bearer = await AccountDataService.AddAccount(Account);
            if(bearer == "Incorrect credentials")
            {
                await JSRuntime.InvokeVoidAsync("Alert", "Incorrect credentials!");
            }
            else
            {
                await JSRuntime.InvokeVoidAsync("WriteCookie", "JWT", bearer, 0.05);
                await JSRuntime.InvokeVoidAsync("Alert", "You have logged in successfully!");
            }
        }

        protected void NavigateToRegister()
        {
            NavigationManager.NavigateTo("/createaccountsoverview");
        }
    }
}