using VetAppointment.Domain.Models;

namespace VetAppointment.Application.Repositories
{
    public class AppointmentRepository : IAppointmentRepository
    {
        private readonly IDatabaseContext context;

        public AppointmentRepository(IDatabaseContext context)
        {
            this.context = context;
        }

        public void Add(Appointment appointment)
        {
            context.Appointments.Add(appointment);
            context.Save();
        }

        public Appointment GetById(Guid id)
        {
            return this.context.Appointments.SingleOrDefault(app => app.Id == id);//poate nu e bun?
        }

        public IEnumerable<Appointment> GetAll()
        {
            return this.context.Appointments.ToList();
        }
    }
}
