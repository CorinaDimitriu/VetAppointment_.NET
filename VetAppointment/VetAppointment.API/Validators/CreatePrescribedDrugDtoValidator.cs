using FluentValidation;
using VetAppointment.API.Dtos.Create;

namespace VetAppointment.API.Validators
{
    public class CreatePrescribedDrugDtoValidator : AbstractValidator<CreatePrescribedDrugDto>
    {
        public CreatePrescribedDrugDtoValidator()
        {
            RuleFor(dto => dto.Quantity).NotNull().NotEmpty();
            RuleFor(dto => dto.DrugToPrescribeId).NotNull().NotEmpty();
        }
    }
}
