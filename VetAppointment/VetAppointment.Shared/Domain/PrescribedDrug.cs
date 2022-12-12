namespace VetAppointment.Shared.Domain
{
#nullable disable
    public class PrescribedDrug
    {
        public Guid Id { get; private set; }
        public double Quantity { get; private set; }
        public Guid DrugToPrescribeId { get; private set; }
        public double TotalCost { get; private set; }
    }
}
