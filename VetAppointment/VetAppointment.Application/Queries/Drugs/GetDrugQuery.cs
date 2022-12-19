using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries.Drugs
{
    public class GetDrugQuery : IRequest<DrugResponse>
    {
        public Guid DrugId { get; set; }

        public GetDrugQuery(Guid drugId) => DrugId = drugId;
    }
}
