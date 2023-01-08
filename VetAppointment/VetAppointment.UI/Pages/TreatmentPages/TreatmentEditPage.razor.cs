using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages.TreatmentPages
{
    public partial class TreatmentEditPage : ComponentBase
    {
        [Inject]
        public ITreatmentDataService TreatmentDataService { get; set; }
        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }
        [Parameter]
        public Guid TreatmentId { get; set; }
        public TreatmentModel TreatmentToUpdate { get; set; } = new();
        public TreatmentModel TreatmentOld { get; set; } = new();

        protected override async Task OnInitializedAsync()
        {
            Treatment treatment = await TreatmentDataService.GetTreatmentById(TreatmentId);
            TreatmentToUpdate = new TreatmentModel()
            {
                Description = treatment.Description
            };
            TreatmentOld = new TreatmentModel()
            {
                Description = TreatmentToUpdate.Description
            };
        }

        protected async Task UpdateTreatment()
        {
            await TreatmentDataService.UpdateTreatmentById(TreatmentId, TreatmentToUpdate);
            TreatmentOld = new TreatmentModel()
            {
                Description = TreatmentToUpdate.Description
            };
            await JSRuntime.InvokeVoidAsync("Alert", "The treatment has been successfully updated!");
        }

        protected void NavigateToPrescribedDrugs()
        {
            NavigationManager.NavigateTo($"/treatment/{TreatmentId}/prescribeddrugs");
        }

        protected void NavigateBack()
        {
            NavigationManager.NavigateTo($"/treatmentsoverview");
        }
    }
}
