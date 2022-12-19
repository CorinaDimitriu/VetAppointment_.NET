using FluentValidation;
using VetAppointment.Domain.Helpers;

namespace VetAppointment.Application.Commands
{
    public class CreatePetCommandValidator : AbstractValidator<CreatePetCommand>
    {
        public CreatePetCommandValidator()
        {
            RuleFor(dto => dto.Name).NotNull().NotEmpty().Length(1, 100);
        }
    }
}
