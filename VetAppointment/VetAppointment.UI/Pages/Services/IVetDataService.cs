using VetAppointment.Shared.Domain;

#nullable disable
namespace VetAppointment.UI.Pages.Services
{
    public interface IVetDataService
    {
        Task<IEnumerable<Vet>> GetAllVets();
    }
}