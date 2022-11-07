namespace VetAppointment.API.Features.VetClinics
{
    public class VetClinicDto : CreateVetClinicDto
    {
        public Guid Id { get; set; }

        public DateTime RegistrationDate { get; set; }
    }
}
