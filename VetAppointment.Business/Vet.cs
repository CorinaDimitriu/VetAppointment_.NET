using VetAppointment.Business.Enums;
using VetAppointment.Business.Helpers;

namespace VetAppointment.Business
{
    public class Vet : Person
    {
        public Guid Id { get; private set; }

        public string Email { get; private set; }

        public string Phone { get; private set; }


        public Guid ClinicId { get; private set; }


        public static Result<Vet> Create(string name,
            string surname, string birthdate, string gender, string email, string phone)
        {
            if (!Validations.IsValidEmail(email))
            {
                return Result<Vet>.Failure($"Email {email} is not valid");
            }

            if (!Validations.IsValidPhoneNumber(phone))
            {
                return Result<Vet>.Failure($"Phone number {phone} is not valid");
            }

            if (!Enum.TryParse<PersonGender>(gender, out var personGender))
            {
                var expectedGenderValues = Enum.GetNames(typeof(PersonGender));
                var textExpectedGenderValues = string.Join(", ", expectedGenderValues);
                return Result<Vet>.Failure($"The provided gender {gender} is not one from the possible races: {textExpectedGenderValues}");
            }
            var vet = new Vet
            {
                Id = Guid.NewGuid(),
                Name = name,
                Surname = surname,
                Birthdate = birthdate,
                Gender = personGender,
                Email = email,
                Phone = phone,
            };
            return Result<Vet>.Success(vet);
        }

        public void RegisterVetToClinic(VetClinic clinic)
        {
            ClinicId = clinic.Id;
        }
    }
}
