using MediatR;
using VetAppointment.Application.Commands.Drugs;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

#nullable disable
namespace VetAppointment.Application.Handlers
{
    public class UpdateDrugCommandHandler : IRequestHandler<UpdateDrugCommand, DrugResponse>
    {
        private readonly IRepository<Drug> repository;

        public UpdateDrugCommandHandler(IRepository<Drug> repository) => this.repository = repository;
    
        public async Task<DrugResponse> Handle(UpdateDrugCommand command, CancellationToken cancellationToken)
        {
            var drug = await repository.Get(command.Id);

            if (drug == null)
            {
                return null;
            }

            drug.Update(command.Name, command.Quantity, command.UnitPrice);
            var result = await repository.Update(drug);
            return DrugMapper.Mapper.Map<DrugResponse>(result);
        }
    }
}
