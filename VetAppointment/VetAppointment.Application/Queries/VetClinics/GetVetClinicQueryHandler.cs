using MediatR;
using VetAppointment.Application.Mappers;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

#nullable disable
namespace VetAppointment.Application.Queries.VetClinics
{
    public class GetVetClinicQueryHandler : IRequestHandler<GetVetClinicQuery, VetClinicResponse>
    {
        private readonly IRepository<VetClinic> repository;

        public GetVetClinicQueryHandler(IRepository<VetClinic> repository) => this.repository = repository;

        public async Task<VetClinicResponse> Handle(GetVetClinicQuery request,
            CancellationToken cancellationToken)
        {
            var vetClinic = await repository.Get(request.ClinicId);
            if (vetClinic == null)
            {
                return null;
            }

            return VetClinicMapper.Mapper.Map<VetClinicResponse>(vetClinic);
        }
    }
}
