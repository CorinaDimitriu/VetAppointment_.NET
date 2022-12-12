namespace VetAppointment.UI.Pages.Models
{
    public class VetToUpdate
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public DateTime Birthdate { get; set; }
        public string Gender { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string ClinicId { get; set; }
        public string[] Specialisation { get; set; } = new string[1] { "Nutritionist" };
    }
}
