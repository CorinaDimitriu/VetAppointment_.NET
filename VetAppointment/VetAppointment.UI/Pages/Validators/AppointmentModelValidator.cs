using FluentValidation;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Validators
{
    public class AppointmentModelValidator : AbstractValidator<AppointmentModel>
    {
        private readonly string[] vetIds = new string[1] { "No vet available." };
        private readonly string[] petIds = new string[1] { "No pet available." };
        private readonly string[] treatmentIds = new string[1] { "No treatment available." };
    public AppointmentModelValidator()
        {
            RuleFor(appointment => appointment.VetId).Must(el => !el.SequenceEqual(vetIds)).WithMessage("Vet ID cannot be empty.");
            RuleFor(appointment => appointment.PetId).Must(el => !el.SequenceEqual(petIds)).WithMessage("Pet ID cannot be empty.");
            RuleFor(appointment => appointment.TreatmentId).Must(el => !el.SequenceEqual(treatmentIds)).WithMessage("Treatment ID cannot be empty.");
            RuleFor(appointment => appointment.ScheduledDate).GreaterThan(DateTime.Now).WithMessage("Scheduled date must be in the future.");
            RuleFor(appointment => appointment.EstimatedDurationInMinutes).GreaterThan(0).WithMessage("Duration must be greater than 0.");
        }
    }
}
