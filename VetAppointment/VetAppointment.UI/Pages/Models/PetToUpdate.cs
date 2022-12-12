namespace VetAppointment.UI.Pages.Models
{
    public class PetToUpdate
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public DateTime Birthdate { get; set; }
        public string[] Race { get; set; } = new string[1] { "Cat" };
        public string Gender { get; set; }
        public string ClinicId { get; set; }
    }
}
