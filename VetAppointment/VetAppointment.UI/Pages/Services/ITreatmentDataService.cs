using VetAppointment.Shared.Domain;

namespace VetAppointment.UI.Pages.Services
{
    public interface ITreatmentDataService
    {
        Task<IEnumerable<Treatment>> GetAllTreatments();
    }
}