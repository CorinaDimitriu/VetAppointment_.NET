using MediatR;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries.VetClinics.Pets
{
    public class PostPetsInVetClinicQueryHandler : IRequestHandler<PostPetsInVetClinicQuery, List<PetResponse>>
    {
        private readonly IUnitOfWork unitOfWork;

        public PostPetsInVetClinicQueryHandler(IUnitOfWork unitOfWork) => this.unitOfWork = unitOfWork;
    
        public async Task<List<PetResponse>> Handle(PostPetsInVetClinicQuery request, CancellationToken cancellationToken)
        {
            var pets = unitOfWork.PetRepository.All().Result.Where(p => request.PetsIds.Contains(p.Id));
            
            foreach (var pet in pets)
            {
                pet.ConnectToOwner(request.PetOwner);
                pet.RegisterPetToClinic(request.VetClinic);
                await unitOfWork.PetRepository.Update(pet);
            }

            return PetMapper.Mapper.Map<List<PetResponse>>(pets);
        }
    }
}
