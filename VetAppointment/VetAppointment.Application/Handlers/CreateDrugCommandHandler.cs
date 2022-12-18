using MediatR;
using VetAppointment.Application.Commands;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Handlers
{
    public class CreateDrugCommandHandler : IRequestHandler<CreateDrugCommand, DrugResponse>
    {
        private readonly IRepository<Drug> repository;
        public CreateDrugCommandHandler(IRepository<Drug> repository)
        {
            this.repository = repository;
        }
        public async Task<DrugResponse> Handle(CreateDrugCommand request, CancellationToken cancellationToken)
        {
            var drugEntity = DrugMapper.Mapper.Map<Drug>(request);
            if (drugEntity == null)
            {
                throw new ApplicationException("Issue with the mapper");
            }
            var newDrug = await repository.Add(drugEntity);
            return DrugMapper.Mapper.Map<DrugResponse>(newDrug);
        }
    }
}
