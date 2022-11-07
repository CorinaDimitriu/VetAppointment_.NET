using VetAppointment.Business;

namespace VetAppointment.API.Features.Appointments
{
    public interface IAppointmentRepository
    {
        void Add(Appointment appointment);
        IEnumerable<Appointment> GetAll();
        Appointment GetById(Guid id);
    }
}