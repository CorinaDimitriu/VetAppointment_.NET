using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries
{
    public class DeleteDrugQuery : IRequest<DrugResponse>
    {
        public Guid Id { get; }
        public DeleteDrugQuery(Guid guid)
        {
            Id = guid;
        }
    }
}
