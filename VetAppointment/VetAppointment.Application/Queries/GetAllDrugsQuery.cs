using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries
{
    public class GetAllDrugsQuery: IRequest<List<DrugResponse>>
    {
    }
}
