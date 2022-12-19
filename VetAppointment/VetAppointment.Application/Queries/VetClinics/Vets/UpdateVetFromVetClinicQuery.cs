using MediatR;
using VetAppointment.Application.Commands.Vets;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries.VetClinics.Vets
{
    public class UpdateVetFromVetClinicQuery : IRequest<ResponseStatusCodes>
    {
        public Guid ClinicId { get; }
        public Guid VetId { get; }
        public CreateVetCommand Command { get; }

        public UpdateVetFromVetClinicQuery(Guid clinicId, Guid vetId, CreateVetCommand command)
        {
            ClinicId = clinicId;
            VetId = vetId;
            Command = command;
        }
    }
}
