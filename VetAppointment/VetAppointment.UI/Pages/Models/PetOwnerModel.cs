namespace VetAppointment.UI.Pages.Models
{
    public class PetOwnerModel
    {
        public string Name { get; set; }
        public string Surname { get; set; }
        public DateTime Birthdate { get; set; } = DateTime.Parse("1/1/1900");
        public string Gender { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
    }
}
