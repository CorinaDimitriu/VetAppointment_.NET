using MediatR;
using VetAppointment.Application.Response;

namespace VetAppointment.Application.Queries.VetClinics
{
    public class GetAllVetClinicsQuery : IRequest<List<VetClinicResponse>> { }
}
