using MediatR;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Queries.Drugs
{
    public class GetAllDrugsQueryHandler : IRequestHandler<GetAllDrugsQuery, List<DrugResponse>>
    {
        private readonly IRepository<Drug> repository;

        public GetAllDrugsQueryHandler(IRepository<Drug> repository) => this.repository = repository;

        public async Task<List<DrugResponse>> Handle(GetAllDrugsQuery request, CancellationToken cancellationToken)
            => DrugMapper.Mapper.Map<List<DrugResponse>>(await repository.All());
    }
}
