using VetAppointment.Domain.Enums;
using VetAppointment.Domain.Helpers;

namespace VetAppointment.Domain.Models
{
#nullable disable
    public class PetOwner : Person
    {
        public Guid Id { get; private set; }

        public string Address { get; private set; }

        public string Email { get; private set; }

        public string Phone { get; private set; }

        public List<Pet> Pets;


        public static Result<PetOwner> Create(string name,
            string surname, string birthdate, string gender, string address, string email, string phone)
        {
            if (!Validations.IsValidEmail(email))
            {
                return Result<PetOwner>.Failure($"Email {email} is not valid");
            }

            if (!Validations.IsValidPhoneNumber(phone))
            {
                return Result<PetOwner>.Failure($"Phone number {phone} is not valid");
            }

            if (!Enum.TryParse<PersonGender>(gender, out var personGender))
            {
                var expectedGenderValues = Enum.GetNames(typeof(PersonGender));
                var textExpectedGenderValues = string.Join(", ", expectedGenderValues);
                return Result<PetOwner>.Failure($"The provided gender {gender} is not one from the possible races: {textExpectedGenderValues}");
            }
            var owner = new PetOwner
            {
                Id = Guid.NewGuid(),
                Name = name,
                Surname = surname,
                Birthdate = birthdate,
                Gender = personGender,
                Address = address,
                Email = email,
                Phone = phone,
                Pets = new List<Pet>()
            };
            return Result<PetOwner>.Success(owner);
        }

        public Result RegisterPetsToOwner(List<Pet> pets)
        {
            if (!pets.Any())
            {
                return Result.Failure("Register at least a pet to the clinic");
            }

            pets.ForEach(pet =>
            {
                pet.ConnectToOwner(this);
                Pets.Add(pet);
            });

            return Result.Success();
        }
    }
}
