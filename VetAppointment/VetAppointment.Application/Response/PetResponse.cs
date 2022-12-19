#nullable disable
namespace VetAppointment.Application.Response
{
    public class PetResponse
    {
        public Guid OwnerId { get; set; }
        public Guid ClinicId { get; set; }
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Birthdate { get; set; }
        public string Race { get; set; }
        public string Gender { get; set; }
    }
}
