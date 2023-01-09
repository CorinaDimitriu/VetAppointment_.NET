using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Services
{
    public interface ITreatmentDataService
    {
        Task<IEnumerable<Treatment>> GetAllTreatments();
        Task<Treatment> GetTreatmentById(Guid id);
        Task<string> AddTreatment(TreatmentModel treatment, string jwt);
        Task<string> UpdateTreatmentById(Guid treatmentId, TreatmentModel treatment, string jwt);
        Task<string> DeleteTreatmentById(Guid treatmentId, string jwt);
        Task<IEnumerable<PrescribedDrug>> GetPrescribedDrugsByTreatmentId(Guid treatmentId);
        Task<string> AddPrescribedDrugsToTreatment(Guid treatmentId, List<PrescribedDrug> drugs, string jwt);
        Task<string> DeletePrescribedDrugById(Guid treatmentId, Guid drugId, string jwt);
        Task<string> UpdatePrescribedDrugById(Guid treatmentId, Guid drugId, PrescribedDrugToUpdateModel drugModel, string jwt);
    }
}