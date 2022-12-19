using MediatR;
using VetAppointment.Application.Commands.Drugs;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

#nullable disable
namespace VetAppointment.Application.Handlers
{
    public class CreateDrugCommandHandler : IRequestHandler<CreateDrugCommand, DrugResponse>
    {
        private readonly IRepository<Drug> repository;

        public CreateDrugCommandHandler(IRepository<Drug> repository) => this.repository = repository;

        public async Task<DrugResponse> Handle(CreateDrugCommand request, CancellationToken cancellationToken)
        {
            var drug = DrugMapper.Mapper.Map<Drug>(request);
            if (drug == null)
            {
                return null;
            }

            var newDrug = await repository.Add(drug);
            return DrugMapper.Mapper.Map<DrugResponse>(newDrug);
        }
    }
}
