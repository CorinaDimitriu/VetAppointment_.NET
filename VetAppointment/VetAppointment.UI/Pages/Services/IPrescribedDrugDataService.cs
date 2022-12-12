using VetAppointment.Shared.Domain;

namespace VetAppointment.UI.Pages.Services
{
    public interface IPrescribedDrugDataService
    {
        Task<IEnumerable<PrescribedDrug>> GetAllPrescribedDrugs();
    }
}