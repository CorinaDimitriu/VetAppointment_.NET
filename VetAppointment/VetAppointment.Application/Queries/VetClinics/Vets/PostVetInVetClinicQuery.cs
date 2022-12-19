using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries.VetClinics.Vets
{
    public class PostVetInVetClinicQuery : IRequest<VetResponse>
    {
        public Guid VetClinicId { get; set; }
        public Guid VetId {get; set; }

        public PostVetInVetClinicQuery(Guid vetClinicId, Guid vetId)
        {
            VetClinicId = vetClinicId;
            VetId = vetId;
        }
    }
}
