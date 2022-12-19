using MediatR;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Queries.VetClinics
{
    public class GetAllVetClinicsQueryHandler : IRequestHandler<GetAllVetClinicsQuery, List<VetClinicResponse>>
    {
        private readonly IRepository<VetClinic> repository;

        public GetAllVetClinicsQueryHandler(IRepository<VetClinic> repository) => this.repository = repository;

        public async Task<List<VetClinicResponse>> Handle(GetAllVetClinicsQuery request, 
            CancellationToken cancellationToken)
        {
            var vetClinics = await repository.All();
            return VetClinicMapper.Mapper.Map<List<VetClinicResponse>>(vetClinics);
        }
    }
}
