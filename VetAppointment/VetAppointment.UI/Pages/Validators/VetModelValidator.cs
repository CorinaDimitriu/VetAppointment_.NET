using FluentValidation;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Validators
{
    public class VetModelValidator : AbstractValidator<VetModel>
    {
        public VetModelValidator()
        {
            RuleFor(vet => vet.Name).NotEmpty().WithMessage("Vet name cannot be empty.");
            RuleFor(vet => vet.Surname).NotEmpty().WithMessage("Vet surname cannot be empty.");
            RuleFor(vet => vet.Birthdate).NotEmpty().WithMessage("Vet birthdate cannot be empty.");
            RuleFor(vet => vet.Gender).NotEmpty().WithMessage("Vet gender cannot be empty.");
            RuleFor(vet => vet.Email).NotEmpty().WithMessage("Email cannot be empty.").EmailAddress().WithMessage("Email does not have a valid format.");
            RuleFor(vet => vet.Phone).NotEmpty().WithMessage("Phone number cannot be empty.").Matches("^\\+40\\d{9}$").WithMessage("Phone number does not have a valid format.");
        }
    }
}
