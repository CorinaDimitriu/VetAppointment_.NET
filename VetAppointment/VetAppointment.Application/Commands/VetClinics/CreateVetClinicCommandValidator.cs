using FluentValidation;

namespace VetAppointment.Application.Commands.VetClinics
{
    public class CreateVetClinicCommandValidator : AbstractValidator<CreateVetClinicCommand>
    {
        public CreateVetClinicCommandValidator()
        {
            RuleFor(x => x.Name)
                .NotNull()
                .NotEmpty()
                .Length(1, 50)
                .WithMessage("Name is required and must be between 1 and 50 characters long");
            RuleFor(x => x.Address)
                .NotNull()
                .NotEmpty()
                .WithMessage("Address is required and must be between 1 and 200 characters long");
            RuleFor(x => x.NumberOfPlaces)
                .NotNull()
                .NotEmpty()
                .GreaterThan(0)
                .WithMessage("Number of places is required and must be greater than 0");
            RuleFor(x => x.ContactEmail)
                .NotEmpty()
                .EmailAddress()
                .WithMessage("Contact email is required and must be a valid email address");
            RuleFor(x => x.ContactPhone)
                .NotEmpty()
                .Matches("^\\+40\\d{9}$")
                .WithMessage("Contact phone is required and must be a valid phone number");
        }
    }
}
