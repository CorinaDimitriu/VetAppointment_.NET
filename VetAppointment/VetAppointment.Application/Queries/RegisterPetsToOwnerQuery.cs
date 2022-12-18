using MediatR;
using VetAppointment.Application.Commands;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries
{
    public class RegisterPetsToOwnerQuery : IRequest<PetOwnerResponse>
    {
        public Guid Id { get; }
        public List<CreatePetCommand> CreatePetCommands { get; }
        public RegisterPetsToOwnerQuery(Guid id, List<CreatePetCommand> petCommands)
        {
            Id = id;
            CreatePetCommands = petCommands;
        }
    }
}
