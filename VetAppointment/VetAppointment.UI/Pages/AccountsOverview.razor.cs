using Blazored.SessionStorage;
using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.UI.Pages.Models;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages
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
        protected async Task Login()
        {
            var bearer = await AccountDataService.AddAccount(Account);
            await JSRuntime.InvokeVoidAsync("WriteCookie", "JWT", bearer, 0.05);
            await JSRuntime.InvokeVoidAsync("Alert", "You have logged in successfully!");
        }
    }
}