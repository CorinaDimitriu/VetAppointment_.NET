namespace VetAppointment.UI.Pages.Models
{
    public class AppointmentModel
    {
        public DateTime ScheduledDate { get; set; } = DateTime.Now;
        public int EstimatedDurationInMinutes { get; set; }
        public string[] VetId { get; set; } = new string[1] { "No vet available." };
        public string[] PetId { get; set; } = new string[1] { "No pet available." };
        public string[] TreatmentId { get; set; } = new string[1] { "No treatment available." };
    }
}
