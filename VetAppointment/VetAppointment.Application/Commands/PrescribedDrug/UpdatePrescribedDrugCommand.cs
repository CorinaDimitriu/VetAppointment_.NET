using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Commands.PrescribedDrug
{
    public class UpdatePrescribedDrugCommand : IRequest<PrescribedDrugResponse>
    {
        public Guid Id { get; set; }
        public Guid DrugToPrescribeId { get; set; }
        public double Quantity { get; set; }
    }
}
