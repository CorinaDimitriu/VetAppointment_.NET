using Microsoft.AspNetCore.Identity;
using System.Reflection;
using VetAppointment.Domain.Enums;
using VetAppointment.Domain.Helpers;

namespace VetAppointment.Domain
{
    public class Account
    {
        public Guid Id { get; private set; }
#nullable disable
        public string Username { get; private set; }
        public string Password { get; private set; }

        public Role Role { get; private set; }

        public static Result<Account> Create(string username, string password, string role, bool hash = false)
        {
            if (username == null || username.Length < 4)
            {
                return Result<Account>.Failure($"Username can't contain less than 4 characters.");
            }

            if (!Validations.IsValidPassword(password))
            {
                return Result<Account>.Failure($"Password not valid.");
            }

            string hashedPassword;

            if (hash)
            {
                var passHAsher = new PasswordHasher<string>();
                hashedPassword = passHAsher.HashPassword("no need", password);
            }
            else
            {
                hashedPassword = password;
            }

            if (!Enum.TryParse<Role>(role, out var accountRole))
            {
                var expectedRoles = Enum.GetNames(typeof(Role));
                var textExpectedRoles = string.Join(", ", expectedRoles);
                return Result<Account>.Failure($"The provided role {role} is not one from the possible races: {textExpectedRoles}");
            }

            var account = new Account
            {
                Id = Guid.NewGuid(),
                Username = username,
                Password = hashedPassword,
                Role = accountRole
            };

            return Result<Account>.Success(account);
        }
    }
}
