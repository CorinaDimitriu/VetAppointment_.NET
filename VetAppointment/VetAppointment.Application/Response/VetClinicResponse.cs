#nullable disable
namespace VetAppointment.Application.Response
{
    public class VetClinicResponse
    {
        public Guid Id { get; set; }
        public Guid MedicalHistoryId { get; set; }
        public DateTime RegistrationDate { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public int NumberOfPlaces { get; set; }
        public string ContactEmail { get; set; }
        public string ContactPhone { get; set; }
    }
}
