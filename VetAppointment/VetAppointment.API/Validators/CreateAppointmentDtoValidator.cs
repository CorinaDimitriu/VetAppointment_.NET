using FluentValidation;
using VetAppointment.API.Dtos.Create;

namespace VetAppointment.API.Validators
{
#nullable disable
    public class CreateAppointmentDtoValidator : AbstractValidator<CreateAppointmentDto>
    {
        public CreateAppointmentDtoValidator()
        {
            RuleFor(dto => dto.ScheduledDate).NotNull().NotEmpty().Must(Validations.BeValidDate);
            RuleFor(dto => dto.EstimatedDurationInMinutes).NotNull().NotEmpty().GreaterThan(0);
            RuleFor(dto => dto.VetId).NotNull().NotEmpty();
            RuleFor(dto => dto.PetId).NotNull().NotEmpty();
            RuleFor(dto => dto.TreatmentId).NotNull().NotEmpty();
            RuleFor(dto => dto.MedicalHistoryId).NotNull().NotEmpty();
        }
    }
}
