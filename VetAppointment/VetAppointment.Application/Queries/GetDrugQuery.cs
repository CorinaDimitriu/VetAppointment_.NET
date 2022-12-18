using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries
{
    public class GetDrugQuery: IRequest<DrugResponse>
    {
        public Guid DrugId { get; set; }
        public GetDrugQuery(Guid drugId)
        {
            this.DrugId=drugId;
        }
    }
}
