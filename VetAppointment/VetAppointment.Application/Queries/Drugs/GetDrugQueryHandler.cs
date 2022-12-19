using MediatR;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Queries.Drugs
{
    public class GetDrugQueryHandler : IRequestHandler<GetDrugQuery, DrugResponse>
    {
        private readonly IRepository<Drug> repository;

        public GetDrugQueryHandler(IRepository<Drug> repository) => this.repository = repository;

        public async Task<DrugResponse> Handle(GetDrugQuery request, CancellationToken cancellationToken)
            => DrugMapper.Mapper.Map<DrugResponse>(await repository.Get(request.DrugId));
    }
}
