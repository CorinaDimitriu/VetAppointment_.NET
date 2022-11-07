using VetAppointment.API.Data;
using VetAppointment.Business;

namespace VetAppointment.API.Features.Appointments
{
    public class AppointmentRepository : IAppointmentRepository
    {
        private readonly DatabaseContext context;

        public AppointmentRepository(DatabaseContext context)
        {
            this.context = context;
        }

        public void Add(Appointment appointment)
        {
            context.Set<Appointment>().Add(appointment);
            context.SaveChanges();
        }

        public Appointment GetById(Guid id)
        {
            return this.context.Set<Appointment>().SingleOrDefault(app => app.Id == id);
        }

        public IEnumerable<Appointment> GetAll()
        {
            return this.context.Set<Appointment>().ToList();
        }
    }
}
