using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Services
{
    public interface IAppointmentDataService
    {
        Task<Appointment> AddAppointment(Appointment appointment);
        Task<IEnumerable<Appointment>> GetAllAppointments();
        Task<Appointment> GetAppointmentById(Guid id);
        Task<string> DeleteAppointmentById(Guid appointmentId);
        Task<string> UpdateAppointmentById(Guid appointmentId, AppointmentModel appointment);
    }
}