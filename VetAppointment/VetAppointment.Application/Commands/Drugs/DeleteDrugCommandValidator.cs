using FluentValidation;

namespace VetAppointment.Application.Commands.Drugs
{
    public class DeleteDrugCommandValidator : AbstractValidator<DeleteDrugCommand>
    {
        public DeleteDrugCommandValidator()
        {
            RuleFor(x => x.DrugId).NotEmpty().WithMessage("DrugId is required");
        }
    }
}
