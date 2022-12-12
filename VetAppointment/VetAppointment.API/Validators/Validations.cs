using VetAppointment.Domain.Enums;

namespace VetAppointment.API.Validators
{
    public class Validations
    {
        public bool BeValidDate(string value)
        {
            return DateTime.TryParse(value, out var _);
        }

        public bool BeInPersonGenderEnum(string value)
        {
            return Enum.TryParse<PersonGender>(value, out _);
        }

        public bool BeInSpecialisationEnum(string value)
        {
            return Enum.TryParse<VetSpecialisation>(value, out _);
        }

        public bool BeInAnimalRaceEnum(string value)
        {
            return Enum.TryParse<AnimalRace>(value, out _);
        }

        public bool BeInAnimalGenderEnum(string value)
        {
            return Enum.TryParse<AnimalGender>(value, out var _);
        }
    }
}
