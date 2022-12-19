using MediatR;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Queries.PrescribedDrugs
{
    public class GetPrescribedDrugQueryHandler : IRequestHandler<GetPrescribedDrugQuery, PrescribedDrugResponse>
    {
        private readonly IRepository<PrescribedDrug> repository;

        public GetPrescribedDrugQueryHandler(IRepository<PrescribedDrug> repository) => this.repository = repository;

        public async Task<PrescribedDrugResponse> Handle(GetPrescribedDrugQuery request, CancellationToken cancellationToken) 
            => PrescribedDrugMapper.Mapper.Map<PrescribedDrugResponse>(await repository.Get(request.Id));
    }
}
