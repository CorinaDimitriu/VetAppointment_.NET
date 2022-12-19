using MediatR;
using VetAppointment.Application.Response;
using VetAppointment.Mappers;

#nullable disable
namespace VetAppointment.Application.Queries.VetClinics.Vets
{
    public class PostVetInVetClinicQueryHandler : IRequestHandler<PostVetInVetClinicQuery, VetResponse>
    {
        private readonly IUnitOfWork unitOfWork;

        public PostVetInVetClinicQueryHandler(IUnitOfWork unitOfWork) => this.unitOfWork = unitOfWork;

        public async Task<VetResponse> Handle(PostVetInVetClinicQuery request, CancellationToken cancellationToken)
        {
            var vetClinic = await unitOfWork.VetClinicRepository.Get(request.VetClinicId);
            var vet = await unitOfWork.VetRepository.Get(request.VetId);
            
            if (vet == null || vetClinic == null)
            {
                return null;
            }

            vetClinic.RegisterVetToClinic(vet);

            vet = await unitOfWork.VetRepository.Update(vet);
            await unitOfWork.VetClinicRepository.Update(vetClinic);

            return VetMapper.Mapper.Map<VetResponse>(vet);
        }
    }
}
