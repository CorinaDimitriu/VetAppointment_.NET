using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Services
{
    public interface IDrugDataService
    {
        Task<IEnumerable<Drug>> GetAllDrugs();
        Task<Drug> GetDrugById(Guid id);
        Task<string> AddDrug(DrugModel drug, string jwt);
        Task<string> DeleteDrugById(Guid drugId, string jwt);
        Task<string> UpdateDrugById(Guid drugId, DrugModel drug, string jwt);
    }
}