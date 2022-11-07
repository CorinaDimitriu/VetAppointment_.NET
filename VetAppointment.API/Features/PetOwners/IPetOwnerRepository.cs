using VetAppointment.Business;

namespace VetAppointment.API.Features.PetOwners
{
    public interface IPetOwnerRepository
    {
        void Add(PetOwner petOwner);

        public PetOwner GetById(Guid id);
        IEnumerable<PetOwner> GetAll();
    }
}