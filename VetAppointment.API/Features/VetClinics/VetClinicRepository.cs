using Microsoft.EntityFrameworkCore;
using VetAppointment.API.Data;
using VetAppointment.Business;

namespace VetAppointment.API.Features.VetClinics
{
    public class VetClinicRepository : IVetClinicRepository
    {
        private readonly DatabaseContext context;

        public VetClinicRepository(DatabaseContext context)
        {
            this.context = context;
        }

        public void Add(VetClinic vetClinic)
        {
            context.Set<VetClinic>().Add(vetClinic);
            context.SaveChanges();
        }

        public VetClinic GetById(Guid id)
        {
            return this.context.Set<VetClinic>().Include(vet => vet.Pets)
                .SingleOrDefault(vet => vet.Id == id);
        }

        public IEnumerable<VetClinic> GetAll()
        {
            return this.context.Set<VetClinic>().Include(vet => vet.Pets).
                Include(vet => vet.Vets).ToList();
        }
    }
}
