using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries.VetClinics.Vets
{
    public class DeleteVetFromVetClinicQuery : IRequest<VetResponse>
    {
        public Guid ClinicId { get; }
        public Guid VetId { get; }
        
        public DeleteVetFromVetClinicQuery(Guid clinicId, Guid vetId)
        {
            ClinicId = clinicId;
            VetId = vetId;
        }
    }
}
