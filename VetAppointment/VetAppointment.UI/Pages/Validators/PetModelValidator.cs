using FluentValidation;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Validators
{
    public class PetModelValidator : AbstractValidator<PetsInClinicModel>
    {
        private readonly string[] ownerIds = new string[1] { "No pet owner available." };
        public PetModelValidator()
        {
            RuleForEach(modelPet => modelPet.Pets).SetValidator(new PetValidator());
            RuleFor(modelPet => modelPet.OwnerId).Must(el => !el.SequenceEqual(ownerIds)).WithMessage("Owner ID cannot be empty.");
        }
    }
}
