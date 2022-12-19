using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries.VetClinics.Vets
{
    public class GetVetFromVetClinicQuery : IRequest<VetResponse>
    {
        public Guid VetClinicId { get; set; }
        public Guid VetId { get; set; }

        public GetVetFromVetClinicQuery(Guid vetClinicId, Guid vetId)
        {
            VetClinicId = vetClinicId;
            VetId = vetId;
        }
    }
}
