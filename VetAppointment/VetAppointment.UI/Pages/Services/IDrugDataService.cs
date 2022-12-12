using VetAppointment.Shared.Domain;

namespace VetAppointment.UI.Pages.Services
{
    public interface IDrugDataService
    {
        Task<IEnumerable<Drug>> GetAllDrugs();
    }
}