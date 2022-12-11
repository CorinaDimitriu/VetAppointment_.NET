using FluentValidation;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Validators
{
    public class ModelPetValidator : AbstractValidator<ModelPetsInClinic>
    {
        public ModelPetValidator()
        {
            RuleForEach(modelPet => modelPet.Pets).SetValidator(new PetValidator());
            RuleFor(modelPet => modelPet.ClinicId).NotEmpty().WithMessage("Clinic ID cannot be empty.");
        }
    }
}
