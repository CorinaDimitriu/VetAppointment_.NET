using FluentValidation;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Validators
{
    public class PrescribedDrugsInTreatmentModelValidator : AbstractValidator<PrescribedDrugsInTreatmentModel>
    {
        public PrescribedDrugsInTreatmentModelValidator()
        {
            RuleForEach(drug => drug.PrescribedDrugs).SetValidator(new PrescribedDrugModelValidator());
        }
    }
}
