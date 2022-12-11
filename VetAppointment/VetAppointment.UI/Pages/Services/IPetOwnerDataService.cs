using VetAppointment.Shared.Domain;

namespace VetAppointment.UI.Pages.Services
{
    public interface IPetOwnerDataService
    {
        Task<IEnumerable<PetOwner>> GetAllPetOwners();
    }
}