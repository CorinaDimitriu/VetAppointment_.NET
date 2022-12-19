using MediatR;
using VetAppointment.Application.Commands.Drugs;
using VetAppointment.Domain;

namespace VetAppointment.Application.Handlers
{
    public class DeleteDrugCommandHandler : IRequestHandler<DeleteDrugCommand, bool>
    {
        private readonly IRepository<Drug> repository;

        public DeleteDrugCommandHandler(IRepository<Drug> repository) => this.repository = repository;

        public async Task<bool> Handle(DeleteDrugCommand command, CancellationToken cancellationToken)
        {
            var drug = await repository.Get(command.DrugId);
            if (drug == null)
            {
                return false;
            }

            await repository.Delete(drug);
            return true;
        }
    }
}
