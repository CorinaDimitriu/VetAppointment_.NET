using MediatR;
using VetAppointment.Application.Commands.Pets;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries.PetOwners
{
    public class RegisterPetsToOwnerQuery : IRequest<List<PetResponse>>
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
