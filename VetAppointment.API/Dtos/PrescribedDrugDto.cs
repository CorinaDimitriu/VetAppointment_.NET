namespace VetAppointment.API.Dtos
{
    public class PrescribedDrugDto
    {
        public float Quantity { get; set; }
        public float TotalCost { get; set; }

        public Guid DrugId { get; set; }
            
    }
}
