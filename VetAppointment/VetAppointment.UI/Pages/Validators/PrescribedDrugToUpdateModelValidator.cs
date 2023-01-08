using FluentValidation;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Validators
{
    public class PrescribedDrugToUpdateModelValidator : AbstractValidator<PrescribedDrugToUpdateModel>
    {
        private readonly string[] drugIds = new string[1] { "No drug available." };
        public PrescribedDrugToUpdateModelValidator()
        {
            RuleFor(drug => drug.Quantity).GreaterThan(0).WithMessage("Quantity must be greater than 0.");
            RuleFor(drug => drug.DrugId).Must(el => !el.SequenceEqual(drugIds)).WithMessage("Drug ID cannot be empty.");
        }
    }
}
