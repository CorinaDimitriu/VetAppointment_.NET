using MediatR;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries
{
    public class GetDrugsQueryHandler : IRequestHandler<GetDrugQuery,DrugResponse>
    {
        private readonly IRepository<DrugResponse> repository;
        public GetDrugsQueryHandler(IRepository<DrugResponse> repository)
        {
            this.repository = repository;
        }

        public async Task<DrugResponse> Handle(GetDrugQuery request, CancellationToken cancellationToken)
        {
            var result = DrugMapper.Mapper.Map<DrugResponse>(await repository.Get(request.DrugId));
            return result;
        }
    }
}
