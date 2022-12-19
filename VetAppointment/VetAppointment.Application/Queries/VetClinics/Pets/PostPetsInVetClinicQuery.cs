using MediatR;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Queries.VetClinics.Pets
{
    public class PostPetsInVetClinicQuery : IRequest<List<PetResponse>>
    {
        public VetClinic VetClinic { get; }
        public PetOwner PetOwner { get; }
        public List<Guid> PetsIds { get; }
        
        public PostPetsInVetClinicQuery(VetClinic vetClinic, PetOwner petOwner, List<Guid> petsIds)
        {
            VetClinic = vetClinic;
            PetOwner = petOwner;
            PetsIds = petsIds;
        }
    }
}
