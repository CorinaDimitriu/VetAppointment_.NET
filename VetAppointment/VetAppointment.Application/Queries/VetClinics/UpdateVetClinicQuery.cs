using MediatR;
using VetAppointment.Application.Commands.VetClinics;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries.VetClinics
{
    public class UpdateVetClinicQuery : IRequest<ResponseStatusCodes>
    {
        public Guid ClinicId { get; }
        public CreateVetClinicCommand Command { get; }

        public UpdateVetClinicQuery(Guid clinicId, CreateVetClinicCommand command)
        {
            ClinicId = clinicId;
            Command = command;
        }
    }
}
