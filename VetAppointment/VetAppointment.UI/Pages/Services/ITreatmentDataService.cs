using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Services
{
    public interface ITreatmentDataService
    {
        Task<IEnumerable<Treatment>> GetAllTreatments();
        Task<Treatment> GetTreatmentById(Guid id);
        Task<TreatmentModel> AddTreatment(TreatmentModel treatment);
        Task<string> UpdateTreatmentById(Guid treatmentId, TreatmentModel treatment);
        Task<string> DeleteTreatmentById(Guid treatmentId);
        Task<IEnumerable<PrescribedDrug>> GetPrescribedDrugsByTreatmentId(Guid treatmentId);
        Task<string> AddPrescribedDrugsToTreatment(Guid treatmentId, List<PrescribedDrug> drugs);
        Task<string> DeletePrescribedDrugById(Guid treatmentId, Guid drugId);
        Task<string> UpdatePrescribedDrugById(Guid treatmentId, Guid drugId, PrescribedDrugToUpdateModel drugModel);
    }
}