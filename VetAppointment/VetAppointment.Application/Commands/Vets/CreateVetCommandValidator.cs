using FluentValidation;

namespace VetAppointment.Application.Commands.Vets
{
    public class CreateVetCommandValidator : AbstractValidator<CreateVetCommand>
    {
        public CreateVetCommandValidator()
        {
            RuleFor(x => x.Name)
                .NotNull()
                .NotEmpty()
                .Length(1, 100)
                .WithMessage("Name is required and must be between 1 and 100 characters long.");
            RuleFor(x => x.Surname)
                .NotNull()
                .NotEmpty()
                .Length(1, 100)
                .WithMessage("Surname is required and must be between 1 and 100 characters long.");
            RuleFor(x => x.Birthdate)
                .NotNull()
                .NotEmpty()
                .Must(Validations.BeValidDate)
                .WithMessage("Birthdate is required and must be in the past.");
            RuleFor(x => x.Email)
                .NotNull()
                .NotEmpty()
                .EmailAddress().
                WithMessage("Email is required and must be a valid email address");
            RuleFor(x => x.Phone)
                .NotNull()
                .NotEmpty()
                .Matches("^\\+40\\d{9}$")
                .WithMessage("Phone is required and must be a valid phone number");
            RuleFor(x => x.Specialisation)
                .NotNull()
                .NotEmpty()
                .Must(Validations.BeInSpecialisationEnum)
                .WithMessage("Specialisation is required and must be a valid specialisation");
            RuleFor(x => x.Gender)
                .NotNull()
                .NotEmpty()
                .Must(Validations.BeInPersonGenderEnum)
                .WithMessage("Gender is required and must be a valid gender");
        }
    }
}
