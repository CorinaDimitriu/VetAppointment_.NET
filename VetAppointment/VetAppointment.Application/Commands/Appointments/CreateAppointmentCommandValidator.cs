using FluentValidation;

namespace VetAppointment.Application.Commands.Appointments
{
    public class CreateAppointmentCommandValidator : AbstractValidator<CreateAppointmentCommand>
    {
        public CreateAppointmentCommandValidator()
        {
            RuleFor(x => x.ScheduledDate)
                .NotEmpty()
                .WithMessage("Scheduled date is required");
            RuleFor(x => x.EstimatedDurationInMinutes)
                .NotEmpty()
                .GreaterThan(0)
                .WithMessage("Estimated duration is required and must be greater than 0");
            RuleFor(x => x.VetId)
                .NotEmpty()
                .WithMessage("Vet id is required");
            RuleFor(x => x.PetId)
                .NotEmpty()
                .WithMessage("Pet id is required");
            RuleFor(x => x.TreatmentId)
                .NotEmpty()
                .WithMessage("Treatment id is required");
            RuleFor(x => x.MedicalHistoryId)
                .NotEmpty()
                .WithMessage("Medical history id is required");
        }
    }
}
