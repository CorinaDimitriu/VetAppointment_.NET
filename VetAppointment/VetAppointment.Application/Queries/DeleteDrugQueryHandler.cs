using MediatR;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Queries
{
    public class DeleteDrugQueryHandler : IRequestHandler<DeleteDrugQuery, DrugResponse>
    {
        private readonly IRepository<Drug> repository;

        public DeleteDrugQueryHandler(IRepository<Drug> repository)
        {
            this.repository = repository;
        }
        public async Task<DrugResponse> Handle(DeleteDrugQuery request, CancellationToken cancellationToken)
        {
            var drug = DrugMapper.Mapper.Map<Drug>(await repository.Get(request.Id));
            await repository.Delete(drug);
            return null; // aici de gasit un return ok...
        }
    }
}
