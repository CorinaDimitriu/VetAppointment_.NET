using VetAppointment.Shared.Domain;

namespace VetAppointment.UI.Pages.Services
{
    public interface IVetDataService
    {
        Task<IEnumerable<Vet>> GetAllVets();
    }
}