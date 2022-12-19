using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Commands
{
    public class CreatePetOwnerCommand : IRequest<PetOwnerResponse>
    {
        public string? Name { get; set; }
        public string? Surname { get; set; }
        public DateTime Birthdate { get; set; }
        public string? Gender { get; set; }
        public string? Address { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }
    }
}
