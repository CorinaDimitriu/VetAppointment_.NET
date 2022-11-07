using VetAppointment.API.Data;
using VetAppointment.Business;

namespace VetAppointment.API.Features.Pets
{
    public class PetRepository : IPetRepository
    {
        private readonly DatabaseContext context;

        public PetRepository(DatabaseContext context)
        {
            this.context = context;
        }

        public void Add(Pet pet)
        {
            context.Set<Pet>().Add(pet);
            context.SaveChanges();
        }

        public IEnumerable<Pet> GetAll()
        {
            return this.context.Set<Pet>().ToList();
        }
    }
}
