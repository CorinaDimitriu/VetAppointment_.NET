using VetAppointment.API.Data;
using VetAppointment.Business;

namespace VetAppointment.API.Features.Vets
{
    public class VetRepository : IVetRepository
    {
        private readonly DatabaseContext context;

        public VetRepository(DatabaseContext context)
        {
            this.context = context;
        }

        public void Add(Vet vet)
        {
            context.Set<Vet>().Add(vet);
            context.SaveChanges();
        }

        public IEnumerable<Vet> GetAll()
        {
            return this.context.Set<Vet>().ToList();
        }
    }
}
