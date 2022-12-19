#nullable disable
using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Commands.Drugs
{
    public class CreateDrugCommand : IRequest<DrugResponse>
    {
        public string Name { get; set; }
        public double Quantity { get; set; }
        public double UnitPrice { get; set; }
    }
}
