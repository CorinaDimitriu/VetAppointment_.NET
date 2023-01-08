namespace VetAppointment.Shared.Domain
{
#nullable disable
    public class PrescribedDrug
    {
        public Guid Id { get; set; }
        public double Quantity { get; set; }
        public Guid DrugToPrescribeId { get; set; }
        public double TotalCost { get; set; }
    }
}
