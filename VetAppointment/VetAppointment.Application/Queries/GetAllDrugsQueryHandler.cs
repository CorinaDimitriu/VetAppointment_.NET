using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries
{
    public class GetAllDrugsQueryHandler : IRequestHandler<GetAllDrugsQuery, List<DrugResponse>>
    {
        private readonly IRepository<DrugResponse> repository;
        public GetAllDrugsQueryHandler(IRepository<DrugResponse> repository)
        {
            this.repository = repository;
        }

        public async Task<List<DrugResponse>> Handle(GetAllDrugsQuery request, CancellationToken cancellationToken)
        {
            var result = DrugMapper.Mapper.Map<List<DrugResponse>>(await repository.All());
            return result;
        }
    }
}
