using FluentValidation;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Validators
{
    public class AccountModelValidator: AbstractValidator<AccountModel>
    {
        public AccountModelValidator()
        {
            RuleFor(account => account.Username).NotEmpty().WithMessage("Username cannot be empty");
            RuleFor(account => account.Password).NotEmpty().WithMessage("Password cannot be empty");
        }
    }
}
