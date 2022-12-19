using MediatR;
using VetAppointment.Application.Commands.Pets;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

#nullable disable
namespace VetAppointment.Application.Handlers
{
    public class CreatePetCoammandHandler : IRequestHandler<CreatePetCommand, PetResponse>
    {
        private readonly IRepository<Pet> repository;

        public CreatePetCoammandHandler(IRepository<Pet> repository) => this.repository = repository;

        public async Task<PetResponse> Handle(CreatePetCommand request, CancellationToken cancellationToken)
        {
            var pet = PetMapper.Mapper.Map<Pet>(request);
            if (pet == null)
            {
                return null;
            }

            var result =await repository.Add(pet);
            return PetMapper.Mapper.Map<PetResponse>(result);
        }
    }
}
