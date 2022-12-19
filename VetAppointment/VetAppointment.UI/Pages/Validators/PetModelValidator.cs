using FluentValidation;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Validators
{
    public class PetModelValidator : AbstractValidator<PetsInClinicModel>
    {
        public PetModelValidator()
        {
            RuleForEach(modelPet => modelPet.Pets).SetValidator(new PetValidator());
        }
    }
}
