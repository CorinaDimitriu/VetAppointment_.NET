using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries.VetClinics.Pets
{
    public class GetAllPetsFromClinicAndOwnerQuery : IRequest<List<PetResponse>>
    {
        public Guid ClinicId { get; }
        public Guid OwnerId { get; }

        public GetAllPetsFromClinicAndOwnerQuery(Guid clinicId, Guid ownerId)
        {
            ClinicId = clinicId;
            OwnerId = ownerId;
        }
    }
}
