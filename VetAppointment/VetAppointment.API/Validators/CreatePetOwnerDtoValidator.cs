using FluentValidation;
using VetAppointment.API.Dtos.Create;

namespace VetAppointment.API.Validators
{
    public class CreatePetOwnerDtoValidator : AbstractValidator<CreatePetOwnerDto>
    {
        public CreatePetOwnerDtoValidator()
        {
            RuleFor(dto => dto.Name).NotNull().NotEmpty().Length(1, 100);
            RuleFor(dto => dto.Surname).NotNull().NotEmpty().Length(1, 100);
            RuleFor(dto => dto.Birthdate).NotNull().NotEmpty().Must(new Validations().BeValidDate);
            RuleFor(dto => dto.Gender).NotNull().NotEmpty().Must(new Validations().BeInPersonGenderEnum);
            RuleFor(dto => dto.Address).NotNull().NotEmpty().Length(1, 250);
            RuleFor(dto => dto.Email).NotNull().NotEmpty().EmailAddress();
            RuleFor(dto => dto.Phone).NotNull().NotEmpty().Matches("^\\+40\\d{9}$");
            //RuleFor(dto => dto.Birthdate).LessThan(DateTime.Now.ToString());
        }
    }
}
