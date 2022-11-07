using Microsoft.EntityFrameworkCore;
using VetAppointment.API.Data;
using VetAppointment.Business;

namespace VetAppointment.API.Features.PetOwners
{
    public class PetOwnerRepository : IPetOwnerRepository
    {
        private readonly DatabaseContext context;

        public PetOwnerRepository(DatabaseContext context)
        {
            this.context = context;
        }

        public void Add(PetOwner petOwner)
        {
            context.Set<PetOwner>().Add(petOwner);
            context.SaveChanges();
        }

        public PetOwner GetById(Guid id)
        {
            return this.context.Set<PetOwner>().Include(owner => owner.Pets)
                .SingleOrDefault(owner => owner.Id == id);
        }

        public IEnumerable<PetOwner> GetAll()
        {
            return this.context.Set<PetOwner>().Include(owner => owner.Pets).ToList();
        }
    }
}
