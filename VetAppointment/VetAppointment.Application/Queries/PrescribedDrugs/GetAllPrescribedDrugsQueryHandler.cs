using MediatR;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Queries.PrescribedDrugs
{
    public class GetAllPrescribedDrugsQueryHandler : IRequestHandler<GetAllPrescribedDrugsQuery, List<PrescribedDrugResponse>>
    {
        private readonly IRepository<PrescribedDrug> repository;

        public GetAllPrescribedDrugsQueryHandler(IRepository<PrescribedDrug> repository) => this.repository = repository;

        public async Task<List<PrescribedDrugResponse>> Handle(GetAllPrescribedDrugsQuery request, CancellationToken cancellationToken) 
            => PrescribedDrugMapper.Mapper.Map<List<PrescribedDrugResponse>>(await repository.All());
    }
}
