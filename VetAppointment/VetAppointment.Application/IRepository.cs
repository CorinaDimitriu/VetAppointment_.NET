using System.Linq.Expressions;

namespace VetAppointment.Application
{
    public interface IRepository<T>
    {
        Task<T> Add(T entity);
        Task<IEnumerable<T>> All();
        Task Delete(T entity);
        Task<IEnumerable<T>> Find(Expression<Func<T, bool>> predicate);
        Task<T> Get(Guid id);
        Task SaveChanges();
        Task<T> Update(T entity);
    }
}