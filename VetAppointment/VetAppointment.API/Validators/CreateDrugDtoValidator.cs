using FluentValidation;
using VetAppointment.API.Dtos.Create;

namespace VetAppointment.API.Validators
{
    public class CreateDrugDtoValidator : AbstractValidator<CreateDrugDto>
    {
        public CreateDrugDtoValidator()
        {
            RuleFor(dto => dto.Name).NotNull().NotEmpty().Length(1, 100);
            RuleFor(dto => dto.Quantity).NotNull().NotEmpty();
            RuleFor(dto => dto.UnitPrice).NotNull().NotEmpty();
        }
    }
}
