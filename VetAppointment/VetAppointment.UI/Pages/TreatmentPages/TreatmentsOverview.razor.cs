using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages.TreatmentPages
{
#nullable disable
    public partial class TreatmentsOverview : ComponentBase
    {
        [Inject]
        public ITreatmentDataService TreatmentDataService { get; set; }
        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }
        public List<Treatment> TreatmentsToGet { get; set; } = default!;
        public TreatmentModel Treatment { get; set; } = new();

        protected async override Task OnInitializedAsync()
        {
            TreatmentsToGet = (await TreatmentDataService.GetAllTreatments()).ToList();
        }

        protected async Task AddTreatment()
        {
            var jwt = await JSRuntime.InvokeAsync<string>("ReadCookie", "JWT");
            var bearer = await TreatmentDataService.AddTreatment(Treatment, jwt);
            if (bearer == "Unauthorized")
            {
                await JSRuntime.InvokeVoidAsync("Alert", "Insufficient privileges!");
            }
            else
            {
                Treatment = new();
                await JSRuntime.InvokeVoidAsync("Alert", "The treatment has been successfully added!");
                TreatmentsToGet = (await TreatmentDataService.GetAllTreatments()).ToList();
            }
        }

        protected async Task DeleteTreatment(Guid treatmentId)
        {
            bool isDeleting = await JSRuntime.InvokeAsync<bool>("ConfirmDelete", "treatment", treatmentId);
            if (isDeleting)
            {
                var jwt = await JSRuntime.InvokeAsync<string>("ReadCookie", "JWT");
                var bearer = await TreatmentDataService.DeleteTreatmentById(treatmentId, jwt);
                if (bearer == "Unauthorized")
                {
                    await JSRuntime.InvokeVoidAsync("Alert", "Insufficient privileges!");
                }
                else
                {
                    await JSRuntime.InvokeVoidAsync("Alert", "The treatment has been successfully deleted!");
                    TreatmentsToGet = (await TreatmentDataService.GetAllTreatments()).ToList();
                }
            }
        }

        protected void NavigateToEditPage(Guid treatmentId)
        {
            NavigationManager.NavigateTo($"/treatment/{treatmentId}");
        }
    }
}