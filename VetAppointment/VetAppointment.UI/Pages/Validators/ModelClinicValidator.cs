using FluentValidation;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Validators
{
    public class ModelClinicValidator : AbstractValidator<ModelClinic>
    {
        public ModelClinicValidator()
        {
            RuleFor(clinic => clinic.Id).NotEmpty().WithMessage("Clinid ID cannot be empty.");
            RuleFor(clinic => clinic.Name).NotEmpty().WithMessage("Clinic name cannot be empty.");
            RuleFor(clinic => clinic.Address).NotEmpty().WithMessage("Clinic address cannot be empty.");
            RuleFor(clinic => clinic.NumberOfPlaces).GreaterThan(0).WithMessage("Number of places must be greater than 0.");
            RuleFor(clinic => clinic.ContactEmail).NotEmpty().WithMessage("Email cannot be empty.").EmailAddress().WithMessage("Email does not have a valid format.");
            RuleFor(clinic => clinic.ContactPhone).NotEmpty().WithMessage("Phone number cannot be empty.").Matches("^\\+40\\d{9}$").WithMessage("Phone number  does not have a valid format.");
        }
    }
}
