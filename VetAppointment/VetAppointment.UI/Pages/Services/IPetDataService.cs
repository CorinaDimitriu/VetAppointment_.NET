using Blazored.SessionStorage;
using VetAppointment.Shared.Domain;

namespace VetAppointment.UI.Pages.Services
{
    public interface IPetDataService
    {
        Task<IEnumerable<Pet>> GetAllPets(string jwt);
        Task<Pet> GetPetById(Guid id);
    }
}