using MediatR;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

#nullable disable
namespace VetAppointment.Application.Queries.VetClinics
{
    public class UpdateVetClinicQueryHandler : IRequestHandler<UpdateVetClinicQuery, ResponseStatusCodes>
    {
        private readonly IRepository<VetClinic> repository;

        public UpdateVetClinicQueryHandler(IRepository<VetClinic> repository) => this.repository = repository;

        public async Task<ResponseStatusCodes> Handle(UpdateVetClinicQuery request, CancellationToken cancellationToken)
        {
            var clinic = await repository.Get(request.ClinicId);
            if (clinic == null)
            {
                return ResponseStatusCodes.NotFound;
            }

            var result = clinic.Update(request.Command.Name, request.Command.Address, request.Command.NumberOfPlaces,
                request.Command.ContactEmail, request.Command.ContactPhone);

            if (result.IsFailure)
            {
                return ResponseStatusCodes.BadRequest;
            }
            
            await repository.Update(clinic);
            return ResponseStatusCodes.Ok;
        }
    }
}
