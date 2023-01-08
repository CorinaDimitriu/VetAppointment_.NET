using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Services
{
    public interface IPetOwnerDataService
    {
        Task<IEnumerable<PetOwner>> GetAllPetOwners();
        Task<PetOwner> GetPetOwnerById(Guid id);
        Task<PetOwner> AddPetOwner(PetOwner petOwner);
        Task<string> UpdatePetOwnerById(Guid ownerId, PetOwnerModel owner);
        Task<string> DeletePetOwnerById(Guid ownerId);
        Task<IEnumerable<Pet>> GetPetsByOwnerId(Guid ownerId);
    }
}