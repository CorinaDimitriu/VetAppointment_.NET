using FluentValidation;
using VetAppointment.API.Dtos.Create;

namespace VetAppointment.API.Validators
{
    public class CreateTreatmentDtoValidator : AbstractValidator<CreateTreatmentDto>
    {
        public CreateTreatmentDtoValidator()
        {
            RuleFor(dto => dto.Description).NotNull().NotEmpty().Length(1, 1000);
        }
    }
}
