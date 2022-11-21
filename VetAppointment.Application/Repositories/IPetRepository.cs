
using VetAppointment.Domain.Models;

namespace VetAppointment.Application.Repositories
{
    public interface IPetRepository
    {
        void Add(Pet pet);
        IEnumerable<Pet> GetAll();
    }
}