using MediatR;
using VetAppointment.Application.Commands;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries
{
    public class UpdateDrugQuery : IRequest<DrugResponse> 
    {
        public Guid Id { get; }
        public CreateDrugCommand DrugCommand { get; }
        public UpdateDrugQuery(Guid id, CreateDrugCommand drugCommand)
        {
            Id = id;
            DrugCommand = drugCommand;
        }
    }
}
