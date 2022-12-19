using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries.PetOwners
{
    public class GetAllPetOwnersQuery : IRequest<List<PetOwnerResponse>> { }
}
