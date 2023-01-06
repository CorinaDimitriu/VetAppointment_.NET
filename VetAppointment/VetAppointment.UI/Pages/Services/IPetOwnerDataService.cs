using VetAppointment.Shared.Domain;

namespace VetAppointment.UI.Pages.Services
{
    public interface IPetOwnerDataService
    {
        Task<IEnumerable<PetOwner>> GetAllPetOwners();
        Task<PetOwner> GetPetOwnerById(Guid id);
        Task<PetOwner> AddPetOwner(PetOwner petOwner);
        Task<PetOwner> AddPetsToPetOwner(Guid petOwnerId, List<Pet> pets);
    }
}