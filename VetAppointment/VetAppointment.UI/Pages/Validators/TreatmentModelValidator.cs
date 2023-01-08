using FluentValidation;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Validators
{
    public class TreatmentModelValidator : AbstractValidator<TreatmentModel>
    {
        public TreatmentModelValidator()
        {
            RuleFor(treatment => treatment.Description).NotEmpty().WithMessage("Description cannot be empty.");
        }
    }
}
