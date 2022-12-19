using MediatR;
using VetAppointment.Application.Response;
using VetAppointment.Domain;
using VetAppointment.Mappers;

#nullable disable
namespace VetAppointment.Application.Queries.VetClinics.Vets
{
    public class GetAllVetsFromVetClinicQueryHandler : IRequestHandler<GetAllVetsFromVetClinicQuery, List<VetResponse>>
    {
        private readonly IRepository<VetClinic> repository;

        public GetAllVetsFromVetClinicQueryHandler(IRepository<VetClinic> repository) => this.repository = repository;

        public async Task<List<VetResponse>> Handle(GetAllVetsFromVetClinicQuery request, CancellationToken cancellationToken)
        {
            var vetClinic = await repository.Get(request.VetClinicId);
            if (vetClinic == null)
            {
                return null;
            }

            return VetMapper.Mapper.Map<List<VetResponse>>(vetClinic.Vets);
        }
    }
}
