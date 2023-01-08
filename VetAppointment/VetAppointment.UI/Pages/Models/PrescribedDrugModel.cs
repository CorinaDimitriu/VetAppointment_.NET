namespace VetAppointment.UI.Pages.Models
{
    public class PrescribedDrugModel
    {
        public double Quantity { get; set; }
        public string[] DrugId { get; set; } = new string[1] { "No drug available." };
        public bool Hidden { get; set; }
    }
}
