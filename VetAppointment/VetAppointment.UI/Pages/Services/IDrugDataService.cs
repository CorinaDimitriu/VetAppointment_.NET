using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Services
{
    public interface IDrugDataService
    {
        Task<IEnumerable<Drug>> GetAllDrugs();
        Task<Drug> GetDrugById(Guid id);
        Task<DrugModel> AddDrug(DrugModel drug);
        Task<string> DeleteDrugById(Guid drugId);
        Task<string> UpdateDrugById(Guid drugId, DrugModel drug);
    }
}