using MediatR;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;

#nullable disable
namespace VetAppointment.Application.Queries.VetClinics.Pets
{
    public class GetAllPetsFromClinicAndOwnerQueryHandler : IRequestHandler<GetAllPetsFromClinicAndOwnerQuery, List<PetResponse>>
    {
        private readonly IUnitOfWork unitOfWork;

        public GetAllPetsFromClinicAndOwnerQueryHandler(IUnitOfWork unitOfWork) => this.unitOfWork = unitOfWork;

        public async Task<List<PetResponse>> Handle(GetAllPetsFromClinicAndOwnerQuery request, CancellationToken cancellationToken)
        {
            var pets = (await unitOfWork.PetRepository.All())
                .Where(p => p.ClinicId == request.ClinicId && p.OwnerId == request.OwnerId);

            return PetMapper.Mapper.Map<List<PetResponse>>(pets);
        }
    }
}
