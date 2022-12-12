using Microsoft.EntityFrameworkCore;
using System;
using System.Linq.Expressions;
using System.Security.Cryptography.X509Certificates;
using VetAppointment.Domain;
using VetAppointment.Infrastructure.Data;

#nullable disable
namespace VetAppointment.Infrastructure.Repositories.GenericRepositories
{
    public class MedicalHistoryRepository : Repository<MedicalHistory>
    {
        private readonly DatabaseContext _databaseContext;
        public MedicalHistoryRepository(DatabaseContext context) : base(context)
        {
            _databaseContext = context;
        }

        public override async Task<MedicalHistory> Get(Guid id)
        {
            return await _databaseContext.Set<MedicalHistory>()
            .Include(x => x.Appointments)
            .SingleOrDefaultAsync(x => x.Id == id);
        }

        public override async Task<IEnumerable<MedicalHistory>> All()
        {
            return await _databaseContext.Set<MedicalHistory>()
            .Include(x => x.Appointments)
            .ToListAsync();
        }
    }
}
