﻿using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using VetAppointment.Shared.Domain;
using VetAppointment.Shared.Domain.Enums;
using VetAppointment.UI.Pages.Models;
using VetAppointment.UI.Pages.Services;

#nullable disable
namespace VetAppointment.UI.Pages.ClinicPages
{
    public partial class ClinicVets : ComponentBase
    {
        [Inject]
        public IVetClinicDataService VetClinicDataService { get; set; }
        [Inject]
        public IJSRuntime JSRuntime { get; set; }
        [Inject]
        public NavigationManager NavigationManager { get; set; }   
        [Parameter]
        public Guid ClinicId { get; set; }
        public List<Vet> VetsToGet { get; set; } = default!;
        public VetModel Vet { get; set; } = new VetModel();
        public List<string> Specialisations { get; set; } =
            Enum.GetNames(typeof(VetSpecialisation)).Select(s => s.ToString()).ToList();

        protected override async Task OnInitializedAsync()
        {
            VetsToGet = (await VetClinicDataService.GetVetsByClinicId(ClinicId)).ToList();
        }

        protected async Task AddVetToClinic()
        {
            await VetClinicDataService.AddVetToClinic(ClinicId, Vet);
        }

        protected async Task DeleteVet(Guid vetId)
        {
            bool isDeleting = await JSRuntime.InvokeAsync<bool>("ConfirmDelete", "vet", vetId);
            if (isDeleting)
            {
                await VetClinicDataService.DeleteVetById(new VetToDeleteModel() { IdToDeleteClinic = ClinicId.ToString(), IdToDeleteVet = vetId.ToString() });
                VetsToGet = (await VetClinicDataService.GetVetsByClinicId(ClinicId)).ToList();
            }
        }

        protected void NavigateToEditPage(Guid vetId)
        {
            NavigationManager.NavigateTo($"{ClinicId}/vet/{vetId}");
        }
    }
}