using FluentValidation;

namespace VetAppointment.Application.Commands.PrescribedDrug
{
    public class DeletePrescribedDrugCommandValidator : AbstractValidator<DeletePrescribedDrugCommand>
    {
        public DeletePrescribedDrugCommandValidator()
        {
            RuleFor(x => x.Id).NotEmpty().WithMessage("Id is required");
        }
    }
}
