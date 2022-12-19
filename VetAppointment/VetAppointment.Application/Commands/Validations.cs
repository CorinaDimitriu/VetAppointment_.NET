using VetAppointment.Domain.Enums;

namespace VetAppointment.Application.Commands
{
    public static class Validations
    {
        public static bool BeValidDate(string value)
        {
            return DateTime.TryParse(value, out var _);
        }

        public static bool BeInPersonGenderEnum(string value)
        {
            return Enum.TryParse<PersonGender>(value, out _);
        }

        public static bool BeInSpecialisationEnum(string value)
        {
            return Enum.TryParse<VetSpecialisation>(value, out _);
        }

        public static bool BeInAnimalRaceEnum(string value)
        {
            return Enum.TryParse<AnimalRace>(value, out _);
        }

        public static bool BeInAnimalGenderEnum(string value)
        {
            return Enum.TryParse<AnimalGender>(value, out var _);
        }
    }
}
