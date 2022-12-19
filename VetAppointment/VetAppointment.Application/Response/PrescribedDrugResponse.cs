namespace VetAppointment.Application.Response
{
    public class PrescribedDrugResponse
    {
        public Guid Id { get; set; }
        public Guid DrugToPrescribeId { get; set; }
        public double Quantity { get; set; }
        public double TotalCost { get; set; }
    }
}
