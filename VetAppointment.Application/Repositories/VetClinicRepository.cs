using Microsoft.EntityFrameworkCore;
using VetAppointment.Domain.Models;

namespace VetAppointment.Application.Repositories
{
    public class VetClinicRepository : IVetClinicRepository
    {
        private readonly IDatabaseContext context;

        public VetClinicRepository(IDatabaseContext context)
        {
            this.context = context;
        }

        public void Add(VetClinic vetClinic)
        {
            context.VetClinics.Add(vetClinic);
            context.Save();
        }

        public VetClinic GetById(Guid id)
        {
            return this.context.VetClinics.Include(vet => vet.Pets).SingleOrDefault(vet => vet.Id == id);//sdfsd
        }

        public IEnumerable<VetClinic> GetAll()
        {
            return this.context.VetClinics.Include(vet => vet.Pets).
                Include(vet => vet.Vets).ToList();
        }
    }
}
