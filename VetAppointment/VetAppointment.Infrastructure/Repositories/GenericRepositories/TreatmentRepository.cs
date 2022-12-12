using Microsoft.EntityFrameworkCore;
using VetAppointment.Domain;
using VetAppointment.Infrastructure.Data;

#nullable disable
namespace VetAppointment.Infrastructure.Repositories.GenericRepositories
{
    public class TreatmentRepository : Repository<Treatment>
    {
        private readonly DatabaseContext _databaseContext;
        public TreatmentRepository(DatabaseContext context) : base(context)
        {
            _databaseContext = context;
        }

        public override async Task<Treatment> Get(Guid id)
        {
            return await _databaseContext.Set<Treatment>()
            .Include(x => x.PrescribedDrugs)
            .SingleOrDefaultAsync(x => x.Id == id);
        }

        public override async Task<IEnumerable<Treatment>> All()
        {
            return await _databaseContext.Set<Treatment>()
            .Include(x => x.PrescribedDrugs)
            .ToListAsync();
        }
    }
}
