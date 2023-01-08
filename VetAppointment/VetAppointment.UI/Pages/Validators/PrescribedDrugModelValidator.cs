using FluentValidation;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Validators
{
    public class PrescribedDrugModelValidator : AbstractValidator<PrescribedDrugModel>
    {
        private readonly string[] drugIds = new string[1] { "No pet owner available." };
        public PrescribedDrugModelValidator()
        {
            RuleFor(drug => drug.Quantity).GreaterThan(0).When(drug => !drug.Hidden).WithMessage("Quantity must be greater than 0.");
            RuleFor(drug => drug.DrugId).Must(el => !el.SequenceEqual(drugIds)).WithMessage("Drug ID cannot be empty.");
        }
    }
}
