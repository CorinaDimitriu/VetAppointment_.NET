using MediatR;
using VetAppointment.Application.Response;

#nullable disable
namespace VetAppointment.Application.Queries.VetClinics.Vets
{
    public class UpdateVetFromVetClinicQueryHandler : IRequestHandler<UpdateVetFromVetClinicQuery, ResponseStatusCodes>
    {
        private readonly IUnitOfWork unitOfWork;

        public UpdateVetFromVetClinicQueryHandler(IUnitOfWork unitOfWork) => this.unitOfWork = unitOfWork;

        public async Task<ResponseStatusCodes> Handle(UpdateVetFromVetClinicQuery request, CancellationToken cancellationToken)
        {
            var vetClinic = await unitOfWork.VetClinicRepository.Get(request.ClinicId);
            if (vetClinic == null)
            {
                return ResponseStatusCodes.NotFound;
            }

            var vet = vetClinic.Vets.FirstOrDefault(v => v.Id == request.VetId);
            if (vet == null)
            {
                return ResponseStatusCodes.NotFound;
            }

            var result = vet.Update(request.Command.Name, request.Command.Surname, request.Command.Birthdate,
                request.Command.Gender, request.Command.Email, request.Command.Phone, request.Command.Specialisation);

            if (result.IsFailure)
            {
                return ResponseStatusCodes.BadRequest;
            }

            await unitOfWork.VetRepository.Update(vet);

            return ResponseStatusCodes.NoContent;
        }
    }
}
