using VetAppointment.Domain.Models;

namespace VetAppointment.Application.Repositories
{
    public interface IVetRepository
    {
        void Add(Vet vet);
        IEnumerable<Vet> GetAll();
    }
}