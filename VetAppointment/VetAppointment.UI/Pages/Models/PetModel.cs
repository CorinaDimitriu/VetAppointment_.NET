#nullable disable
namespace VetAppointment.UI.Pages.Models
{
    public class PetModel
    {
        public string Name { get; set; }
        public DateTime Birthdate { get; set; } = DateTime.Parse("1/1/1900");
        public string[] Race { get; set; } = new string[1] { "Dog" };
        public string Gender { get; set; }
        public bool Hidden { get; set; }
    }
}
