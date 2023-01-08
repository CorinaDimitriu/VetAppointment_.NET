using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages.DrugPages
{
#nullable disable
    public partial class DrugsOverview : ComponentBase
    {
        [Inject]
        public IDrugDataService DrugDataService { get; set; }
        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }
        public List<Drug> DrugsToGet { get; set; } = default!;
        public DrugModel Drug { get; set; } = new();

        protected async override Task OnInitializedAsync()
        {
            DrugsToGet = (await DrugDataService.GetAllDrugs()).ToList();
        }

        protected async Task AddDrug()
        {
            await DrugDataService.AddDrug(Drug);
            await JSRuntime.InvokeVoidAsync("Alert", "The drug has been successfully added!");
            DrugsToGet = (await DrugDataService.GetAllDrugs()).ToList();
            Drug = new();
        }

        protected async Task DeleteDrug(Guid drugId)
        {
            bool isDeleting = await JSRuntime.InvokeAsync<bool>("ConfirmDelete", "drug", drugId);
            if (isDeleting)
            {
                await DrugDataService.DeleteDrugById(drugId);
                await JSRuntime.InvokeVoidAsync("Alert", "The drug has been successfully deleted!");
                DrugsToGet = (await DrugDataService.GetAllDrugs()).ToList();
            }
        }

        protected void NavigateToEditPage(Guid drugId)
        {
            NavigationManager.NavigateTo($"/drug/{drugId}");
        }
    }
}