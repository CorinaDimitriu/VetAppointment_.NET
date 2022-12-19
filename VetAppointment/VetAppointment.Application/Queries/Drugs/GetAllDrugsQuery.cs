using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries.Drugs
{
    public class GetAllDrugsQuery : IRequest<List<DrugResponse>> { }
}
