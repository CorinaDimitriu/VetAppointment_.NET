#nullable disable
using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Commands.Drugs
{
    public class UpdateDrugCommand : IRequest<DrugResponse>
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public double Quantity { get; set; }
        public double UnitPrice { get; set; }
    }
}
