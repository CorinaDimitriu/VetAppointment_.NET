using MediatR;
using VetAppointment.Application.Response;
using VetAppointment.Domain;
using VetAppointment.Mappers;

#nullable disable
namespace VetAppointment.Application.Queries.VetClinics.Vets
{
    public class GetVetFromVetClinicQueryHandler : IRequestHandler<GetVetFromVetClinicQuery, VetResponse>
    {
        private readonly IRepository<VetClinic> repository;

        public GetVetFromVetClinicQueryHandler(IRepository<VetClinic> repository) => this.repository = repository;

        public async Task<VetResponse> Handle(GetVetFromVetClinicQuery request, CancellationToken cancellationToken)
        {
            var vetClinic = await repository.Get(request.VetClinicId);
            if (vetClinic == null)
            {
                return null;
            }

            var vet = vetClinic.Vets.FirstOrDefault(v => v.Id == request.VetId);
            if (vet == null)
            {
                return null;
            }

            return VetMapper.Mapper.Map<VetResponse>(vet);
        }
    }
}
