using FluentValidation;
using VetAppointment.API.Dtos.Create;

namespace VetAppointment.API.Validators
{
    public class CreateVetClinicDtoValidator : AbstractValidator<CreateVetClinicDto>
    {
        public CreateVetClinicDtoValidator()
        {
            RuleFor(dto => dto.Name).NotNull().NotEmpty().Length(1, 50);
            RuleFor(dto => dto.Address).NotNull().NotEmpty().Length(1, 200);
            RuleFor(dto => dto.NumberOfPlaces).NotNull().NotEmpty().GreaterThan(0);
            RuleFor(dto => dto.ContactEmail).NotNull().NotEmpty().EmailAddress();
            RuleFor(dto => dto.ContactPhone).NotNull().NotEmpty().Matches("^\\+40\\d{9}$");
        }
    }
}
