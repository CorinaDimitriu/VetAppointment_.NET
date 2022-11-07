using VetAppointment.Business;

namespace VetAppointment.API.Features.Vets
{
    public interface IVetRepository
    {
        void Add(Vet vet);
        IEnumerable<Vet> GetAll();
    }
}