using MediatR;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;

#nullable disable
namespace VetAppointment.Application.Queries.VetClinics
{
    public class DeleteVetClinicQueryHandler : IRequestHandler<DeleteVetClinicQuery, VetClinicResponse>
    {
        private readonly IUnitOfWork unitOfWork;

        public DeleteVetClinicQueryHandler(IUnitOfWork unitOfWork) => this.unitOfWork = unitOfWork;

        public async Task<VetClinicResponse> Handle(DeleteVetClinicQuery request, CancellationToken cancellationToken)
        {
            var clinic = await unitOfWork.VetClinicRepository.Get(request.ClinicId);
            if (clinic == null)
            {
                return null;
            }

            var medicalHistory = unitOfWork.MedicalHistoryRepository.Get(clinic.MedicalHistoryId).Result;
            if (medicalHistory != null)
            {
                await unitOfWork.MedicalHistoryRepository.Delete(medicalHistory);
            }

            var vets = unitOfWork.VetRepository.All().Result.Where(v => v.ClinicId == clinic.Id);
            foreach (var vet in vets)
            {
                await unitOfWork.VetRepository.Delete(vet);
            }

            var pets = unitOfWork.PetRepository.All().Result.Where(p => p.ClinicId == clinic.Id);
            foreach (var pet in pets)
            {
                await unitOfWork.PetRepository.Delete(pet);
            }

            await unitOfWork.VetClinicRepository.Delete(clinic);

            return VetClinicMapper.Mapper.Map<VetClinicResponse>(clinic);
        }
    }
}
