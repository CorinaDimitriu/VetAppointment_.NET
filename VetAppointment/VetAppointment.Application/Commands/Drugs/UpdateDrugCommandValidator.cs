using FluentValidation;

namespace VetAppointment.Application.Commands.Drugs
{
    public class UpdateDrugCommandValidator : AbstractValidator<UpdateDrugCommand>
    {
        public UpdateDrugCommandValidator()
        {
            RuleFor(x => x.Id).NotEmpty().WithMessage("Id is required");
            RuleFor(x => x.Name).NotEmpty().MaximumLength(50).WithMessage("Name is required and cannot be longer than 50 characters");
            RuleFor(x => x.Quantity).NotEmpty().GreaterThan(0).WithMessage("Quantity is required and must be greater than 0");
            RuleFor(x => x.UnitPrice).NotEmpty().GreaterThan(0).WithMessage("Unit price is required and must be greater than 0");
        }
    }
}
