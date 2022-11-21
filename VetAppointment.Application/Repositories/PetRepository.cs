using VetAppointment.Domain.Models;

namespace VetAppointment.Application.Repositories
{
    public class PetRepository : IPetRepository
    {
        private readonly IDatabaseContext context;

        public PetRepository(IDatabaseContext context)
        {
            this.context = context;
        }

        public void Add(Pet pet)
        {
            context.Pets.Add(pet);
            context.Save();
        }

        public IEnumerable<Pet> GetAll()
        {
            return this.context.Pets.ToList();
        }
    }
}
