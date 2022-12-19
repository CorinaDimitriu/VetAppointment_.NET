using FluentValidation;

namespace VetAppointment.Application.Commands.PrescribedDrug
{
    public class CreatePrescribedDrugCommandValidator : AbstractValidator<CreatePrescribedDrugCommand>
    {
        public CreatePrescribedDrugCommandValidator()
        {
            RuleFor(x => x.DrugToPrescribeId).NotEmpty().WithMessage("DrugId is required");
            RuleFor(x => x.Quantity).NotEmpty().GreaterThan(0).WithMessage("Quantity must be greater than 0");
        }
    }
}
