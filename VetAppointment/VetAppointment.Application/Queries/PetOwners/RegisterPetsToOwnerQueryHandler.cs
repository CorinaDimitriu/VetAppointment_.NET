using MediatR;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Queries.PetOwners
{
    public class RegisterPetsToOwnerQueryHandler : IRequestHandler<RegisterPetsToOwnerQuery, List<PetResponse>>
    {
        private readonly IUnitOfWork unitOfWork;

        public RegisterPetsToOwnerQueryHandler(IUnitOfWork unitOfWork) => this.unitOfWork = unitOfWork;

        public async Task<List<PetResponse>> Handle(RegisterPetsToOwnerQuery request, CancellationToken cancellationToken)
        {
            var owner = await unitOfWork.PetOwnerRepository.Get(request.Id);

            var pets = request.CreatePetCommands.Select(PetMapper.Mapper.Map<Pet>).ToList();

            owner.RegisterPetsToOwner(pets);
            await unitOfWork.PetOwnerRepository.Update(owner);

            foreach (var pet in pets)
            {
                await unitOfWork.PetRepository.Update(pet);
            }

            return pets.Select(PetMapper.Mapper.Map<PetResponse>).ToList();
        }
    }
}
