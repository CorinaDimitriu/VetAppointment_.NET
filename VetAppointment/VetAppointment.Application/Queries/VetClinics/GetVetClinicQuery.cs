using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries.VetClinics
{
    public class GetVetClinicQuery : IRequest<VetClinicResponse>
    {
        public Guid ClinicId { get; set; }

        public GetVetClinicQuery(Guid clinicId) => ClinicId = clinicId;
    }
}
