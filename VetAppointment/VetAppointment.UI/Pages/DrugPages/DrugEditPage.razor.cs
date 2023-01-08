using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages.DrugPages
{
    public partial class DrugEditPage : ComponentBase
    {
        [Inject]
        public IDrugDataService DrugDataService { get; set; }
        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }
        [Parameter]
        public Guid DrugId { get; set; }
        public DrugModel DrugToUpdate { get; set; } = new();
        public DrugModel DrugOld { get; set; } = new();

        protected override async Task OnInitializedAsync()
        {
            Drug drug = await DrugDataService.GetDrugById(DrugId);
            DrugToUpdate = new DrugModel()
            {
                Name = drug.Name,
                Quantity = drug.Quantity,
                UnitPrice = drug.UnitPrice
            };
            DrugOld = new DrugModel()
            {
                Name = DrugToUpdate.Name,
                Quantity = DrugToUpdate.Quantity,
                UnitPrice = DrugToUpdate.UnitPrice
            };
        }

        protected async Task UpdateDrug()
        {
            await DrugDataService.UpdateDrugById(DrugId, DrugToUpdate);
            DrugOld = new DrugModel()
            {
                Name = DrugToUpdate.Name,
                Quantity = DrugToUpdate.Quantity,
                UnitPrice = DrugToUpdate.UnitPrice
            };
            await JSRuntime.InvokeVoidAsync("Alert", "The drug has been successfully updated!");
        }

        protected void NavigateBack()
        {
            NavigationManager.NavigateTo($"/drugsoverview");
        }
    }
}
