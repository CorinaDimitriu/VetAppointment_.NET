namespace VetAppointment.UI.Pages.Models
{
    public class PrescribedDrugToUpdateModel
    {
        public double Quantity { get; set; }
        public double TotalCost { get; set; }
        public string[] DrugId { get; set; } = new string[1] { "No drug available." };
    }
}
