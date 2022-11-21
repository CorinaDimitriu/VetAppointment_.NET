using VetAppointment.Domain.Models;

namespace VetAppointment.Application.Repositories
{
    public interface IPetOwnerRepository
    {
        void Add(PetOwner petOwner);
        public PetOwner GetById(Guid id);
        IEnumerable<PetOwner> GetAll();
    }
}