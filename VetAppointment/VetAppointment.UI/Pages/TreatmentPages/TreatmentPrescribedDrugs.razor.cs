using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;
using VetAppointment.UI.Pages.Services;

namespace VetAppointment.UI.Pages.TreatmentPages
{
    public partial class TreatmentPrescribedDrugs : ComponentBase
    {
        [Inject]
        public ITreatmentDataService TreatmentDataService { get; set; }
        [Inject]
        public IDrugDataService DrugDataService { get; set; }
        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }
        [Parameter]
        public Guid TreatmentId { get; set; }
        public List<PrescribedDrug> PrescribedDrugsToGet { get; set; } = default!;
        public PrescribedDrugsInTreatmentModel PrescribedDrugsInTreatment { get; set; } = default!;
        public List<string> DrugIds { get; set; } = default!;

        protected override async Task OnInitializedAsync()
        {
            PrescribedDrugsToGet = (await TreatmentDataService.GetPrescribedDrugsByTreatmentId(TreatmentId)).ToList();
            List<Drug> drugs = (await DrugDataService.GetAllDrugs()).ToList();
            DrugIds = new();
            drugs.ForEach(d => DrugIds.Add(d.Id.ToString()));
            if (drugs.Count == 0)
            {
                DrugIds.Add("No drug available.");
            }

            PrescribedDrugsInTreatment = new PrescribedDrugsInTreatmentModel()
            {
                PrescribedDrugs = new List<PrescribedDrugModel>(),
                Count = 1,
            };
            for (int i = 0; i < 10; i++)
            {
                PrescribedDrugsInTreatment.PrescribedDrugs.Add(new PrescribedDrugModel() { Hidden = true });
                PrescribedDrugsInTreatment.PrescribedDrugs[i].DrugId[0] = DrugIds[0];
            }
            PrescribedDrugsInTreatment.PrescribedDrugs[0].Hidden = false;
        }

        protected async Task AddPrescribedDrugsToTreatment()
        {
            var prescribedDrugs = new List<PrescribedDrug>();
            for (int i = 0; i < PrescribedDrugsInTreatment.Count; i++)
                prescribedDrugs.Add(new PrescribedDrug()
                {
                    Quantity = PrescribedDrugsInTreatment.PrescribedDrugs[i].Quantity,
                    DrugToPrescribeId = Guid.Parse(PrescribedDrugsInTreatment.PrescribedDrugs[i].DrugId[0])
                });
            await TreatmentDataService.AddPrescribedDrugsToTreatment(TreatmentId, prescribedDrugs);
            await JSRuntime.InvokeVoidAsync("Alert", "The prescribed drugs have been successfully added!");
            PrescribedDrugsToGet = (await TreatmentDataService.GetPrescribedDrugsByTreatmentId(TreatmentId)).ToList();

            PrescribedDrugsInTreatment = new PrescribedDrugsInTreatmentModel()
            {
                PrescribedDrugs = new List<PrescribedDrugModel>(),
                Count = 1,
            };
            for (int i = 0; i < 10; i++)
            {
                PrescribedDrugsInTreatment.PrescribedDrugs.Add(new PrescribedDrugModel() { Hidden = true });
                PrescribedDrugsInTreatment.PrescribedDrugs[i].DrugId[0] = DrugIds[0];
            }
            PrescribedDrugsInTreatment.PrescribedDrugs[0].Hidden = false;
        }

        protected async Task AddInputFields()
        {
            if (PrescribedDrugsInTreatment.Count < 10)
            {
                PrescribedDrugsInTreatment.Count++;
                PrescribedDrugsInTreatment.PrescribedDrugs[PrescribedDrugsInTreatment.Count - 1].Hidden = false;
            }
            await JSRuntime.InvokeVoidAsync("DynamicInputFields");
        }

        protected async Task RemoveInput()
        {
            if (PrescribedDrugsInTreatment.Count > 1)
            {
                PrescribedDrugsInTreatment.PrescribedDrugs[PrescribedDrugsInTreatment.Count - 1] = new PrescribedDrugModel() { Hidden = true };
                PrescribedDrugsInTreatment.PrescribedDrugs[PrescribedDrugsInTreatment.Count - 1].DrugId[0] = DrugIds[0];
                PrescribedDrugsInTreatment.Count--;
            }
            await JSRuntime.InvokeVoidAsync("RemoveInputFields");
        }

        protected async Task DeletePrescribedDrug(Guid prescribedDrugId)
        {
            bool isDeleting = await JSRuntime.InvokeAsync<bool>("ConfirmDelete", "prescribed drug", prescribedDrugId);
            if (isDeleting)
            {
                await TreatmentDataService.DeletePrescribedDrugById(TreatmentId, prescribedDrugId);
                await JSRuntime.InvokeVoidAsync("Alert", "The prescribed drug has been successfully deleted!");
                PrescribedDrugsToGet = (await TreatmentDataService.GetPrescribedDrugsByTreatmentId(TreatmentId)).ToList();
            }
        }

        protected void NavigateToEditPage(Guid prescribedDrugId)
        {
            NavigationManager.NavigateTo($"{TreatmentId}/prescribeddrug/{prescribedDrugId}");
        }

        protected void NavigateBack()
        {
            NavigationManager.NavigateTo($"treatment/{TreatmentId}/prescribeddrugs");
        }
    }
}
