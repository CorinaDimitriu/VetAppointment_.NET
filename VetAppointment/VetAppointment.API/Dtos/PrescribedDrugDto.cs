using VetAppointment.API.Dtos.Create;

namespace VetAppointment.API.Dtos
{
    public class PrescribedDrugDto : CreatePrescribedDrugDto
    {
        public Guid Id { get; set; }
        public Guid TreatmentId { get; set; }
        public double TotalCost { get; set; }
    }
}
