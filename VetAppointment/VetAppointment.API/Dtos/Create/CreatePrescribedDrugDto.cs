namespace VetAppointment.API.Dtos.Create
{
    public class CreatePrescribedDrugDto
    {
        public double Quantity { get; set; }
        public Guid DrugToPrescribeId { get; set; }
    }
}
