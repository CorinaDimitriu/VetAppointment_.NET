using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries.VetClinics.Vets
{
    public class GetAllVetsFromVetClinicQuery : IRequest<List<VetResponse>> 
    {
        public Guid VetClinicId { get; set; }

        public GetAllVetsFromVetClinicQuery(Guid vetClinicId) => VetClinicId = vetClinicId;
    }
}
