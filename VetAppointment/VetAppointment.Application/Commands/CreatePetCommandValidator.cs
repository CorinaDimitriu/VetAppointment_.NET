using FluentValidation;
using VetAppointment.Domain.Helpers;

namespace VetAppointment.Application.Commands
{
    public class CreatePetCommandValidator : AbstractValidator<CreatePetCommand>
    {
        public CreatePetCommandValidator()
        {
            RuleFor(dto => dto.Name).NotNull().NotEmpty().Length(1, 100);
            //RuleFor(dto => dto.Birthdate).NotNull().NotEmpty().Must(new Validations().BeValidDate);
            //RuleFor(dto => dto.Race).NotNull().NotEmpty().Must(new Validations().BeInAnimalRaceEnum);
            //RuleFor(dto => dto.Gender).NotNull().NotEmpty().Must(new Validations().BeInAnimalGenderEnum);
        }
    }
}
