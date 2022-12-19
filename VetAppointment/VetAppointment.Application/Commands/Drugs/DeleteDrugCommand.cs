using MediatR;

namespace VetAppointment.Application.Commands.Drugs
{
    public class DeleteDrugCommand : IRequest<bool>
    {
        public Guid DrugId { get; set; }
    }
}
