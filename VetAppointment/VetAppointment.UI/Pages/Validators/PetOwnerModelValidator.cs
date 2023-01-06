using FluentValidation;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Validators
{
    public class PetOwnerModelValidator : AbstractValidator<PetOwnerModel>
    {
        public PetOwnerModelValidator()
        {
            RuleFor(owner => owner.Name).NotEmpty().WithMessage("Name cannot be empty.");
            RuleFor(owner => owner.Surname).NotEmpty().WithMessage("Name cannot be empty.");
            RuleFor(owner => owner.Birthdate).NotEmpty().WithMessage("Birthdate cannot be empty.");
            RuleFor(owner => owner.Gender).NotEmpty().WithMessage("Gender cannot be empty.");
            RuleFor(owner => owner.Address).NotEmpty().WithMessage("Gender cannot be empty.");
            RuleFor(owner => owner.Email).NotEmpty().WithMessage("Email cannot be empty.").EmailAddress().WithMessage("Email does not have a valid format.");
            RuleFor(owner => owner.Phone).NotEmpty().WithMessage("Phone number cannot be empty.").Matches("^\\+40\\d{9}$").WithMessage("Phone number does not have a valid format.");
        }
    }
}
