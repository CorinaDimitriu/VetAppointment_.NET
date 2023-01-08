namespace VetAppointment.UI.Pages.Models
{
    public class CreateAccountModel
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string RepeatPassword { get; set; }

        public string[] Role { get; set; } = new string[1] { "Pet_Owner" };
    }
}
