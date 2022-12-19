using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries.VetClinics
{
    public class DeleteVetClinicQuery : IRequest<VetClinicResponse>
    {
        public Guid ClinicId { get; }

        public DeleteVetClinicQuery(Guid clinicId) => ClinicId = clinicId;
    }
}
