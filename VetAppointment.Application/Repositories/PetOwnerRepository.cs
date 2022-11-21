using Microsoft.EntityFrameworkCore;
using VetAppointment.Domain.Models;

namespace VetAppointment.Application.Repositories
{
    public class PetOwnerRepository : IPetOwnerRepository
    {
        private readonly IDatabaseContext context;

        public PetOwnerRepository(IDatabaseContext context)
        {
            this.context = context;
        }

        public void Add(PetOwner petOwner)
        {
            context.PetOwners.Add(petOwner);
            context.Save();
        }

        public PetOwner GetById(Guid id)
        {
            return this.context.PetOwners.Include(owner => owner.Pets).SingleOrDefault(owner => owner.Id == id);//paote trebuie schimbat
        }

        public IEnumerable<PetOwner> GetAll()
        {
            return this.context.PetOwners.Include(owner => owner.Pets).ToList();
        }
    }
}
