using MediatR;
using VetAppointment.Application.Commands.PrescribedDrug;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;

#nullable disable
namespace VetAppointment.Application.Handlers
{
    public class UpdatePrescribedDrugCommandHandler : IRequestHandler<UpdatePrescribedDrugCommand, PrescribedDrugResponse>
    {
        private readonly IUnitOfWork unitOfWork;

        public UpdatePrescribedDrugCommandHandler(IUnitOfWork unitOfWork) => this.unitOfWork = unitOfWork;

        public async Task<PrescribedDrugResponse> Handle(UpdatePrescribedDrugCommand command, CancellationToken cancellationToken)
        {
            var drug = await unitOfWork.DrugRepository.Get(command.DrugToPrescribeId);
            var prescribedDrug = await unitOfWork.PrescribedDrugRepository.Get(command.Id);
            if (prescribedDrug == null)
            {
                return null;
            }

            prescribedDrug.UpdateDrugToPrescribeId(command.DrugToPrescribeId);
            prescribedDrug.UpdateQuantity(command.Quantity);
            prescribedDrug.CalculatePresribedDrugCost(drug);

            prescribedDrug = await unitOfWork.PrescribedDrugRepository.Update(prescribedDrug);

            return PrescribedDrugMapper.Mapper.Map<PrescribedDrugResponse>(prescribedDrug);
        }
    }
}
