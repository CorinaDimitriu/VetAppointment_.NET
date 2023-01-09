using FluentValidation;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Validators
{
    public class PetToUpdateModelValidator : AbstractValidator<PetToUpdateModel>
    {
        public PetToUpdateModelValidator()
        {
            RuleFor(pet => pet.Name).NotEmpty().WithMessage("Name cannot be empty.");
            RuleFor(pet => pet.Birthdate).NotEmpty().WithMessage("Birthdate cannot be empty.");
            RuleFor(pet => pet.Race).NotEmpty().WithMessage("Race cannot be empty.");
            RuleFor(pet => pet.Gender).NotEmpty().WithMessage("Gender cannot be empty.");
            RuleFor(pet => pet.Birthdate).LessThan(DateTime.Now).WithMessage("Birthdate cannot be in the future.");
        }
    }
}
