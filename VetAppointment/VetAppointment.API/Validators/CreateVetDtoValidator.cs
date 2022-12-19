using FluentValidation;
using VetAppointment.API.Dtos.Create;

namespace VetAppointment.API.Validators
{
    public class CreateVetDtoValidator : AbstractValidator<CreateVetDto>
    {
        public CreateVetDtoValidator()
        {
            RuleFor(dto => dto.Name).NotNull().NotEmpty().Length(1, 100);
            RuleFor(dto => dto.Surname).NotNull().NotEmpty().Length(1, 100);
            RuleFor(dto => dto.Birthdate).NotNull().NotEmpty().Must(Validations.BeValidDate);
            RuleFor(dto => dto.Gender).NotNull().NotEmpty().Must(Validations.BeInPersonGenderEnum);
            RuleFor(dto => dto.Email).NotNull().NotEmpty().EmailAddress();
            RuleFor(dto => dto.Phone).NotNull().NotEmpty().Matches("^\\+40\\d{9}$");
            RuleFor(dto => dto.Specialisation).NotNull().NotEmpty().Must(Validations.BeInSpecialisationEnum);
        }
    }
}
