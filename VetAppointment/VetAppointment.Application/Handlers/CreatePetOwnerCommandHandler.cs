using MediatR;
using VetAppointment.Application.Commands.PetOwners;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

#nullable disable
namespace VetAppointment.Application.Handlers
{
    public class CreatePetOwnerCommandHandler : IRequestHandler<CreatePetOwnerCommand, PetOwnerResponse>
    {
        private readonly IRepository<PetOwner> repository;

        public CreatePetOwnerCommandHandler(IRepository<PetOwner> repository) => this.repository = repository;

        public async Task<PetOwnerResponse> Handle(CreatePetOwnerCommand request, CancellationToken cancellationToken)
        {
            var petOwner = PetOwnerMapper.Mapper.Map<PetOwner>(request);
            if (petOwner == null)
            {
                return null;
            }

            var result = await repository.Add(petOwner);
            return PetOwnerMapper.Mapper.Map<PetOwnerResponse>(result);
        }
    }
}
