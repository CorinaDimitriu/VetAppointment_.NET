using Microsoft.EntityFrameworkCore;
using VetAppointment.Domain;
using VetAppointment.Infrastructure.Data;

#nullable disable
namespace VetAppointment.Infrastructure.Repositories.GenericRepositories
{
    public class PetOwnerRepository : Repository<PetOwner>
    {
        private readonly DatabaseContext _databaseContext;
        public PetOwnerRepository(DatabaseContext context) : base(context) 
        {
            _databaseContext = context;
        }

        public override async Task<PetOwner> Get(Guid id)
        {
            return await _databaseContext.Set<PetOwner>()
            .Include(x => x.Pets)
            .SingleOrDefaultAsync(x => x.Id == id);
        }

        public override async Task<IEnumerable<PetOwner>> All()
        {
            return await _databaseContext.Set<PetOwner>()
            .Include(x => x.Pets)
            .ToListAsync();
        }
    }
}
