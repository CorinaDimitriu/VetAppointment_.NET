using FluentValidation;

namespace VetAppointment.Application.Commands.PetOwners
{
    public class CreatePetOwnerCommandValidator : AbstractValidator<CreatePetOwnerCommand>
    {
        public CreatePetOwnerCommandValidator()
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Name is required");
            RuleFor(x => x.Surname).NotEmpty().WithMessage("Surname is required");
            RuleFor(x => x.Birthdate).NotEmpty().Must(Validations.BeValidDate).WithMessage("Birthdate is required and must be valid");
            RuleFor(x => x.Email).NotEmpty().EmailAddress().WithMessage("Email is required and must be valid");
            RuleFor(x => x.Phone).NotEmpty().Matches("^\\+40\\d{9}$").WithMessage("Phone is required and must be valid");
            RuleFor(x => x.Address).NotEmpty().WithMessage("Address is required");
            RuleFor(x => x.Gender).NotEmpty().Must(Validations.BeInPersonGenderEnum).WithMessage("Gender is required and must be valid");
        }
    }
}
