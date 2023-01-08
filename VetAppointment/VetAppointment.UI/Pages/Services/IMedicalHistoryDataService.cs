using VetAppointment.Shared.Domain;

namespace VetAppointment.UI.Pages.Services
{
    public interface IMedicalHistoryDataService
    {
        Task<IEnumerable<MedicalHistory>> GetAllMedicalHistories();
        Task<MedicalHistory> GetMedicalHistoryByClinicId(Guid clinicId);
    }
}
