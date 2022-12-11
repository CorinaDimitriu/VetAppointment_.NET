using Microsoft.EntityFrameworkCore;
using VetAppointment.Domain;
using VetAppointment.Infrastructure.Data;

namespace VetAppointment.Infrastructure.Repositories.GenericRepositories
{
    public class TreatmentRepository : Repository<Treatment>
    {
        private readonly DatabaseContext _databaseContext;
        public TreatmentRepository(DatabaseContext context) : base(context)
        {
            _databaseContext = context;
        }

        public override Treatment Get(Guid id) => _databaseContext.Set<Treatment>()
            .Include(x => x.PrescribedDrugs)
            .SingleOrDefault(x => x.Id == id);

        public override IEnumerable<Treatment> All() => _databaseContext.Set<Treatment>()
            .Include(x => x.PrescribedDrugs)
            .ToList();
    }
}
