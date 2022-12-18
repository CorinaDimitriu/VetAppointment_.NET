using MediatR;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Queries
{
    public class UpdateDrugQueryHandler : IRequestHandler<UpdateDrugQuery, DrugResponse>
    {
        private readonly IRepository<Drug> repository;

        public UpdateDrugQueryHandler(IRepository<Drug> repository)
        {
            this.repository = repository;
        }
        public async Task<DrugResponse> Handle(UpdateDrugQuery request, CancellationToken cancellationToken)
        {
            var drug = repository.Get(request.Id).Result;
            drug.Update(request.DrugCommand.Name, request.DrugCommand.Quantity, request.DrugCommand.UnitPrice);
            var result = DrugMapper.Mapper.Map<DrugResponse>(await repository.Update(drug));
            return result;
        }
    }
}
