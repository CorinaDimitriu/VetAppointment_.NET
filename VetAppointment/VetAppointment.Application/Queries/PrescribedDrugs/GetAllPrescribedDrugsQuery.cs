using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries.PrescribedDrugs
{
    public class GetAllPrescribedDrugsQuery : IRequest<List<PrescribedDrugResponse>> { }
}
