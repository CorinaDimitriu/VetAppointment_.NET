using VetAppointment.Business;

namespace VetAppointment.API.Features.VetClinics
{
    public interface IVetClinicRepository
    {
        void Add(VetClinic vetClinic);
        IEnumerable<VetClinic> GetAll();
        VetClinic GetById(Guid id);
    }
}