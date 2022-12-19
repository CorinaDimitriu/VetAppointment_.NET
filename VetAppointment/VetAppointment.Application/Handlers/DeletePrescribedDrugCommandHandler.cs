using MediatR;
using VetAppointment.Application.Commands.PrescribedDrug;
using VetAppointment.Domain;

namespace VetAppointment.Application.Handlers
{
    public class DeletePrescribedDrugCommandHandler : IRequestHandler<DeletePrescribedDrugCommand, bool>
    {
        private readonly IRepository<PrescribedDrug> repository;

        public DeletePrescribedDrugCommandHandler(IRepository<PrescribedDrug> repository) => this.repository = repository;

        public async Task<bool> Handle(DeletePrescribedDrugCommand command, CancellationToken cancellationToken)
        {
            var prescribedDrug = await repository.Get(command.Id);
            if (prescribedDrug == null)
            {
                return false;
            }

            await repository.Delete(prescribedDrug);

            return true;
        }
    }
}
