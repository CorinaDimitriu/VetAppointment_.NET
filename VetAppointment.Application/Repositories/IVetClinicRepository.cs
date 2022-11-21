using VetAppointment.Domain.Models;

namespace VetAppointment.Application.Repositories
{
    public interface IVetClinicRepository
    {
        void Add(VetClinic vetClinic);
        IEnumerable<VetClinic> GetAll();
        VetClinic GetById(Guid id);
    }
}