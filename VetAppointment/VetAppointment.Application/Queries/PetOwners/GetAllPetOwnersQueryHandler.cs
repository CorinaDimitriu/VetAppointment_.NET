using MediatR;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Queries.PetOwners;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

#nullable disable
namespace VetAppointment.Application.Queries
{
    public class GetAllPetOwnersQueryHandler : IRequestHandler<GetAllPetOwnersQuery, List<PetOwnerResponse>>
    {
        private readonly IRepository<PetOwner> repository;

        public GetAllPetOwnersQueryHandler(IRepository<PetOwner> repository) => this.repository = repository;
        public async Task<List<PetOwnerResponse>> Handle(GetAllPetOwnersQuery request, CancellationToken cancellationToken)
        {
            return PetOwnerMapper.Mapper.Map<List<PetOwnerResponse>>(await repository.All());
        }
    }
}
