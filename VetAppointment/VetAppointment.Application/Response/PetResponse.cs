namespace VetAppointment.Application.Response
{
    public class PetResponse
    {
        public Guid Id { get; set; }
        public string? Name { get; set; }
        public string? Birthdate { get; set; }
        public string? Race { get; set; }
        public string? Gender { get; set; }
    }
}
