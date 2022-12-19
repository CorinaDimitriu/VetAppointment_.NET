using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Queries
{
    public class GetAllDrugsQueryHandler : IRequestHandler<GetAllDrugsQuery, List<DrugResponse>>
    {
        private readonly IRepository<Drug> repository;
        public GetAllDrugsQueryHandler(IRepository<Drug> repository)
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
