using VetAppointment.API.Dtos.Create;

namespace VetAppointment.API.Dtos
{
    public class PetDto : CreatePetDto
    {
        public Guid Id { get; set; }
        public Guid OwnerId { get; set; }
        public Guid ClinicId { get; set; }
    }
}
