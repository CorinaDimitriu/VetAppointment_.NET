using VetAppointment.Domain.Models;

namespace VetAppointment.Application.Repositories
{
    public class VetRepository : IVetRepository
    {
        private readonly IDatabaseContext context;

        public VetRepository(IDatabaseContext context)
        {
            this.context = context;
        }

        public void Add(Vet vet)
        {
            context.Vets.Add(vet);
            context.Save();
        }

        public IEnumerable<Vet> GetAll()
        {
            return this.context.Vets.ToList();
        }
    }
}
