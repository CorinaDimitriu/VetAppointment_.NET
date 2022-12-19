using MediatR;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Queries
{
    public class GetDrugsQueryHandler : IRequestHandler<GetDrugQuery,DrugResponse>
    {
        private readonly IRepository<Drug> repository;
        public GetDrugsQueryHandler(IRepository<Drug> repository)
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
