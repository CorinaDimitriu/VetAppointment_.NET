using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Commands.PrescribedDrug
{
    public class CreatePrescribedDrugCommand : IRequest<PrescribedDrugResponse>
    {
        public Guid DrugToPrescribeId { get; set; }
        public double Quantity { get; set; }
    }
}
