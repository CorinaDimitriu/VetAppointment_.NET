using MediatR;
using VetAppointment.Application.Response;
using VetAppointment.Mappers;

#nullable disable
namespace VetAppointment.Application.Queries.VetClinics.Vets
{
    public class DeleteVetFromVetClinicQueryHandler : IRequestHandler<DeleteVetFromVetClinicQuery, VetResponse>
    {
        private readonly IUnitOfWork unitOfWork;

        public DeleteVetFromVetClinicQueryHandler(IUnitOfWork unitOfWork) => this.unitOfWork = unitOfWork;

        public async Task<VetResponse> Handle(DeleteVetFromVetClinicQuery request, CancellationToken cancellationToken)
        {
            var vetClinic = await unitOfWork.VetClinicRepository.Get(request.ClinicId);
            if (vetClinic == null)
            {
                return null;
            }

            var vet = vetClinic.Vets.FirstOrDefault(v => v.Id == request.VetId);
            if (vet == null)
            {
                return null;
            }

            await unitOfWork.VetRepository.Delete(vet);

            return VetMapper.Mapper.Map<VetResponse>(vet);
        }
    }
}
