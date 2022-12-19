using FluentValidation;

namespace VetAppointment.Application.Commands.Drugs
{
    public class CreateDrugCommandValidator : AbstractValidator<CreateDrugCommand>
    {
        public CreateDrugCommandValidator()
        {
            RuleFor(x => x.Name).NotEmpty().MaximumLength(50);
            RuleFor(x => x.Quantity).NotEmpty().GreaterThan(0);
            RuleFor(x => x.UnitPrice).NotEmpty().GreaterThan(0);
        }
    }
}
