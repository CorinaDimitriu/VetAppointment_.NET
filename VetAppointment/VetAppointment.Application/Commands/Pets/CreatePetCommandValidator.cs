using FluentValidation;

namespace VetAppointment.Application.Commands.Pets
{
    public class CreatePetCommandValidator : AbstractValidator<CreatePetCommand>
    {
        public CreatePetCommandValidator()
        {
            RuleFor(x => x.Name)
                .NotNull()
                .NotEmpty()
                .Length(3, 50)
                .WithMessage("Name must be between 3 and 50 characters long");
            RuleFor(x => x.Birthdate)
                .NotNull()
                .NotEmpty()
                .Must(Validations.BeValidDate)
                .WithMessage("Date is not valid!");
            RuleFor(x => x.Race)
                .NotNull()
                .NotEmpty()
                .Must(Validations.BeInAnimalRaceEnum)
                .WithMessage("Race is not valid");
            RuleFor(x => x.Gender)
                .NotNull()
                .NotEmpty()
                .Must(Validations.BeInAnimalGenderEnum)
                .WithMessage("Gender is not valid");
        }
    }
}
