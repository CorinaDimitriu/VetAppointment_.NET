using VetAppointment.Shared.Domain;

namespace VetAppointment.UI.Pages.Services
{
    public interface IPetDataService
    {
        Task<IEnumerable<Pet>> GetAllPets();
        Task<Pet> AddPet(Pet pet);
    }
}