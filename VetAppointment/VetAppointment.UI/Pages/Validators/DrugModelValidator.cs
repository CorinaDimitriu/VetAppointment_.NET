using FluentValidation;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Validators
{
    public class DrugModelValidator : AbstractValidator<DrugModel>
    {
        public DrugModelValidator()
        {
            RuleFor(drug => drug.Name).NotEmpty().WithMessage("Drug name cannot be empty.");
            RuleFor(drug => drug.Quantity).GreaterThan(0).WithMessage("Quantity must be greater than 0.");
            RuleFor(drug => drug.UnitPrice).GreaterThan(0).WithMessage("Unit Price must be greater than 0.");
        }
    }
}
