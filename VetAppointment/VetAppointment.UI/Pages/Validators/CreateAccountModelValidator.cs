using FluentValidation;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Validators
{
    public class CreateAccountModelValidator : AbstractValidator<CreateAccountModel>
    {
        public CreateAccountModelValidator()
        {
            RuleFor(account => account.Username).NotEmpty().WithMessage("Username cannot be empty").MinimumLength(4).WithMessage("Username must contain at least 4 characters");
            RuleFor(account => account.Password).NotEmpty().WithMessage("Password cannot be empty").WithMessage("Password does not have a valid format.").MinimumLength(8).WithMessage("Password must contain at least 8 characters");

            RuleFor(account => account.Role).NotEmpty().WithMessage("Role cannot be empty");
            RuleFor(account => account.RepeatPassword).Equal(account => account.Password).WithMessage("Missmatch first password introduced"); 
        }
    }
}
