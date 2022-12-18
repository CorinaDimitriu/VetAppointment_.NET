using MediatR;
using VetAppointment.API.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Queries
{
    public class GetAllPetOwnersQueryHandler : IRequestHandler<GetAllPetOwnersQuery, List<PetOwnerResponse>>
    {
        private readonly IRepository<PetOwner> repository;

        public GetAllPetOwnersQueryHandler(IRepository<PetOwner> repository)
        {
            this.repository = repository;
        }
        public async Task<List<PetOwnerResponse>> Handle(GetAllPetOwnersQuery request, CancellationToken cancellationToken)
        {
            var result = PetOwnerMapper.Mapper.Map<List<PetOwnerResponse>>(await repository.All());
            return result;
        }
    }
}
