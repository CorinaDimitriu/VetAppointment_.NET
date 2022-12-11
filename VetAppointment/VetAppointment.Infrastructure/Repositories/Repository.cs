using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;
using VetAppointment.Application;
using VetAppointment.Infrastructure.Data;

#nullable disable
namespace VetAppointment.Infrastructure.Repositories
{
    public class Repository<T> : IRepository<T> where T : class
    {
        private readonly DatabaseContext context;

        public Repository(DatabaseContext context) => this.context = context;

        public virtual async Task<T> Add(T entity)
        {
            await context.AddAsync(entity);
            await context.SaveChangesAsync();
            return entity;
        }

        public virtual async Task<T> Update(T entity)
        {
            context.Update(entity);
            await context.SaveChangesAsync();
            return entity;
        }

        public virtual async Task<T> Get(Guid id) => await context.Set<T>().FindAsync(id);

        public virtual async Task Delete(T entity)
        {
            context.Set<T>().Remove(entity);
            await context.SaveChangesAsync();
        }

        public virtual async Task<IEnumerable<T>> All() => await context.Set<T>().ToListAsync();

        public virtual async Task<IEnumerable<T>> Find(Expression<Func<T, bool>> predicate)
            => await context.Set<T>().Where(predicate).ToListAsync();

        public async Task SaveChanges() => await context.SaveChangesAsync();
    }
}
