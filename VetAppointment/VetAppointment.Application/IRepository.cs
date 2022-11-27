using System.Linq.Expressions;

namespace VetAppointment.Application
{
    public interface IRepository<T>
    {
        //public IDatabaseContext context { get; set; }
        T Add(T entity);
        T Update(T entity);
        T Get(Guid id);
        IEnumerable<T> All();
        IEnumerable<T> Find(Expression<Func<T, bool>> predicate);
        void SaveChanges();
    }
}
