﻿using VetAppointment.Domain.Enums;
using VetAppointment.Domain.Helpers;

#nullable disable
namespace VetAppointment.Domain
{
    public class PetOwner : Person
    {
        public Guid Id { get; private set; }
        public string Address { get; private set; }
        public string Email { get; private set; }
        public string Phone { get; private set; }
        public List<Pet> Pets { get; private set; }

        public static Result<PetOwner> Create(string name, string surname, string birthdate, string gender, string address, 
            string email, string phone)
        {
            if (!Validations.IsValidEmail(email))
            {
                return Result<PetOwner>.Failure($"Email {email} is not valid");
            }

            if (!Validations.IsValidPhoneNumber(phone))
            {
                return Result<PetOwner>.Failure($"Phone number {phone} is not valid");
            }

            if (!DateTime.TryParse(birthdate, out DateTime date))
            {
                return Result<PetOwner>.Failure($"Invalid birthdate - {birthdate}!");
            }

            if (!Enum.TryParse<PersonGender>(gender, out var personGender))
            {
                var expectedGenderValues = Enum.GetNames(typeof(PersonGender));
                var textExpectedGenderValues = string.Join(", ", expectedGenderValues);
                return Result<PetOwner>.Failure($"The provided gender {gender} is not one from the possible genders: {textExpectedGenderValues}");
            }
            
            var owner = new PetOwner
            {
                Id = Guid.NewGuid(),
                Name = name,
                Surname = surname,
                Birthdate = date,
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
                return Result.Failure("Register at least one pet to the owner.");
            }

            pets.ForEach(pet =>
            {
                pet.ConnectToOwner(this);
                Pets.Add(pet);
            });

            return Result.Success();
        }

        public Result<PetOwner> Update(string name, string surname, string birthdate, string gender, string address, string email, string phone)
        {
            if (name != "" && name != null)
            {
                this.Name = name;
            }

            if (surname != "" && surname != null)
            {
                this.Surname = surname;
            }

            if (address != "" && address != null)
            {
                this.Address = address;
            }

            if (!Validations.IsValidEmail(email))
            {
                return Result<PetOwner>.Failure($"Email {email} is not valid");
            }
            this.Email = email;

            if (!Validations.IsValidPhoneNumber(phone))
            {
                return Result<PetOwner>.Failure($"Phone number {phone} is not valid");
            }
            this.Phone = phone;

            if (!DateTime.TryParse(birthdate, out DateTime date))
            {
                return Result<PetOwner>.Failure($"Invalid birthdate - {birthdate}!");
            }
            this.Birthdate = date;

            if (!Enum.TryParse<PersonGender>(gender, out var personGender))
            {
                var expectedGenderValues = Enum.GetNames(typeof(PersonGender));
                var textExpectedGenderValues = string.Join(", ", expectedGenderValues);
                return Result<PetOwner>.Failure($"The provided gender {gender} is not one from the possible genders: {textExpectedGenderValues}");
            }
            this.Gender = personGender;

            return Result<PetOwner>.Success(this);
        }
    }
}
