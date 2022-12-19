using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries.PrescribedDrugs
{
    public class GetPrescribedDrugQuery : IRequest<PrescribedDrugResponse>
    {
        public Guid Id { get; set; }

        public GetPrescribedDrugQuery(Guid id) => Id = id;
    }
}
