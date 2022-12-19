using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries.PetOwners
{
    public class GetPetOwnerCommand : IRequest<PetOwnerResponse>
    {
        public Guid PetOwner { get; }

        public GetPetOwnerCommand(Guid petOwner) => PetOwner = petOwner;
    }
}
