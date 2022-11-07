namespace VetAppointment.API.Features.Appointments
{
    public class CreateAppointmentDto
    {
        public DateTime ScheduledDate { get; set; }

        public int EstimatedDurationInMinutes { get; set; }

        public Guid VetId { get; set; }

        public Guid PetId { get; set; }
    }
}
