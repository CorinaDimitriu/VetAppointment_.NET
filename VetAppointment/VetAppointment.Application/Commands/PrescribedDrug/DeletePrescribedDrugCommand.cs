using MediatR;

namespace VetAppointment.Application.Commands.PrescribedDrug
{
    public class DeletePrescribedDrugCommand : IRequest<bool>
    {
        public Guid Id { get; set; }
    }
}
