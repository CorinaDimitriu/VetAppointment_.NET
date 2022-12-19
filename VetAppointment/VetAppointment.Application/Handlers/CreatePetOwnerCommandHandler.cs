using MediatR;
using VetAppointment.API.Mappers;
using VetAppointment.Application.Commands;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Handlers
{
    public class CreatePetOwnerCommandHandler : IRequestHandler<CreatePetOwnerCommand, PetOwnerResponse>
    {
        private readonly IRepository<PetOwner> repository;
        public CreatePetOwnerCommandHandler(IRepository<PetOwner> repository)
        {
            this.repository = repository;
        }
        public async Task<PetOwnerResponse> Handle(CreatePetOwnerCommand request, CancellationToken cancellationToken)
        {
            var petOwnerEntity = PetOwnerMapper.Mapper.Map<PetOwner>(request);
            var newPetOwner = await repository.Add(petOwnerEntity);
            return PetOwnerMapper.Mapper.Map<PetOwnerResponse>(newPetOwner);
        }
    }
}
