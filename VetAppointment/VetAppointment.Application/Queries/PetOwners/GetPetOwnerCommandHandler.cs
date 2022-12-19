using MediatR;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

#nullable disable
namespace VetAppointment.Application.Queries.PetOwners
{
    public class GetPetOwnerCommandHandler : IRequestHandler<GetPetOwnerCommand, PetOwnerResponse>
    {
        private readonly IRepository<PetOwner> repository;

        public GetPetOwnerCommandHandler(IRepository<PetOwner> repository) => this.repository = repository;

        public async Task<PetOwnerResponse> Handle(GetPetOwnerCommand request, CancellationToken cancellationToken)
        {
            var result = await repository.Get(request.PetOwner);
            if (result == null)
            {
                return null;
            }
            return PetOwnerMapper.Mapper.Map<PetOwnerResponse>(result);
        }
    }
}
