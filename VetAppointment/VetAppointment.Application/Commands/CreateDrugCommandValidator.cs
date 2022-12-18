using FluentValidation;

namespace VetAppointment.Application.Commands
{
    public class CreateDrugCommandValidator : AbstractValidator<CreateDrugCommand>
    {
        public CreateDrugCommandValidator()
        {
            RuleFor(dto => dto.Name).NotNull().NotEmpty().Length(1, 100);
            RuleFor(dto => dto.Quantity).NotNull().NotEmpty();
            RuleFor(dto => dto.UnitPrice).NotNull().NotEmpty();
        }
    }
}
