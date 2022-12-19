using MediatR;
using VetAppointment.Application.Response;

#nullable disable
namespace VetAppointment.Application.Commands.Pets
{
    public class CreatePetCommand : IRequest<PetResponse>
    {
        public string Name { get; set; }
        public string Birthdate { get; set; }
        public string Race { get; set; }
        public string Gender { get; set; }
    }
}
