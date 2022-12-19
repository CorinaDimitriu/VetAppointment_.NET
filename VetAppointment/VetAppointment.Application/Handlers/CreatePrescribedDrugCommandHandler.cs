using MediatR;
using VetAppointment.Application.Commands.PrescribedDrug;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Handlers
{
    public class CreatePrescribedDrugCommandHandler : IRequestHandler<CreatePrescribedDrugCommand, PrescribedDrugResponse>
    {
        private readonly IUnitOfWork unitOfWork;

        public CreatePrescribedDrugCommandHandler(IUnitOfWork unitOfWork) => this.unitOfWork = unitOfWork;

        public async Task<PrescribedDrugResponse> Handle(CreatePrescribedDrugCommand request, CancellationToken cancellationToken)
        {
            var drug = await unitOfWork.DrugRepository.Get(request.DrugToPrescribeId);
            var prescribedDrug = PrescribedDrugMapper.Mapper.Map<PrescribedDrug>(request);
            prescribedDrug.CalculatePresribedDrugCost(drug);

            prescribedDrug = await unitOfWork.PrescribedDrugRepository.Add(prescribedDrug);

            return PrescribedDrugMapper.Mapper.Map<PrescribedDrugResponse>(prescribedDrug);
        }
    }
}
