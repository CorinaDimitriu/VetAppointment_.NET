using VetAppointment.Domain;
using VetAppointment.Infrastructure.Data;

namespace VetAppointment.Infrastructure.Repositories.GenericRepositories
{
    public class AccountRepository : Repository<Account>
    {
        public AccountRepository(DatabaseContext context) : base(context) { }
    }
}
