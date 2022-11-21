using VetAppointment.Domain.Models;

namespace VetAppointment.Application.Repositories
{
    public interface IAppointmentRepository
    {
        void Add(Appointment appointment);
        IEnumerable<Appointment> GetAll();
        Appointment GetById(Guid id);
    }
}