using MediatR;
using VetAppointment.Application.Commands.VetClinics;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

#nullable disable
namespace VetAppointment.Application.Handlers
{
    public class CreatevetClinicCommandHandler : IRequestHandler<CreateVetClinicCommand, VetClinicResponse>
    {
        private readonly IRepository<VetClinic> repository;

        public CreatevetClinicCommandHandler(IRepository<VetClinic> repository) => this.repository = repository;

        public async Task<VetClinicResponse> Handle(CreateVetClinicCommand request, CancellationToken cancellationToken)
        {
            var vetClinic = VetClinicMapper.Mapper.Map<VetClinic>(request);
            if (vetClinic == null)
            {
                return null;
            }

            var medicalHistory = MedicalHistory.Create().Entity;

            medicalHistory.AtachToClinic(vetClinic.Id);
            vetClinic.AttachMedicalHistory(medicalHistory.Id);
            vetClinic.SetRegistrationDate();

            var newVetClinic = await repository.Add(vetClinic);
            return VetClinicMapper.Mapper.Map<VetClinicResponse>(newVetClinic);
        }
    }
}
