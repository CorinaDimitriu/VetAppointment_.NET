using VetAppointment.Domain.Enums;

namespace VetAppointment.Application
{
    public static class Validations
    {
        public static bool BeValidDate(string value) => DateTime.TryParse(value, out var date) && date < DateTime.Now;

        public static bool BeInPersonGenderEnum(string value) => Enum.TryParse<PersonGender>(value, out _);

        public static bool BeInSpecialisationEnum(string value) => Enum.TryParse<VetSpecialisation>(value, out _);

        public static bool BeInAnimalRaceEnum(string value) => Enum.TryParse<AnimalRace>(value, out _);

        public static bool BeInAnimalGenderEnum(string value) => Enum.TryParse<AnimalGender>(value, out var _);
    }
}
