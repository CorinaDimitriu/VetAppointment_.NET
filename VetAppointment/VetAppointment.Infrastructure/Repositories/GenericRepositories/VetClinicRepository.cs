using Microsoft.EntityFrameworkCore;
using VetAppointment.Domain;
using VetAppointment.Infrastructure.Data;

#nullable disable
namespace VetAppointment.Infrastructure.Repositories.GenericRepositories
{
    public class VetClinicRepository : Repository<VetClinic>
    {
        private readonly DatabaseContext _databaseContext;
        public VetClinicRepository(DatabaseContext context) : base(context) 
        {
            _databaseContext = context;
        }

        public override async Task<VetClinic> Get(Guid id)
        {
            return await _databaseContext.Set<VetClinic>()
            .Include(x => x.Pets)
            .Include(x => x.Vets)
            .SingleOrDefaultAsync(x => x.Id == id);
        }

        public override async Task<IEnumerable<VetClinic>> All()
        {
            return await _databaseContext.Set<VetClinic>()
            .Include(x => x.Pets)
            .Include(x => x.Vets)
            .ToListAsync();
        }
    }
}
