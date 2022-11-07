using VetAppointment.Business.Enums;
using VetAppointment.Business.Helpers;

namespace VetAppointment.Business
{
    public class Pet
    {
        public Guid Id { get; private set; }

        public string Name { get; private set; }

        public int Age { get; private set; }

        public AnimalRace Race { get; private set; }

        public AnimalGender Gender { get; private set; }

        public Guid OwnerId { get; private set; }

        public Guid ClinicId { get; private set; }



        public static Result<Pet> Create(string name, int age, string race, string gender)
        {
            if(!Enum.TryParse<AnimalRace>(race, out var animalRace))
            {
                var expectedRaceValues = Enum.GetNames(typeof(AnimalRace));
                var textExpectedRaceValues = string.Join(", ", expectedRaceValues);
                return Result<Pet>.Failure($"The provided race {race} is not one from the possible races: {textExpectedRaceValues}");
            }
            if (!Enum.TryParse<AnimalGender>(gender, out var animalGender))
            {
                var expectedGenderValues = Enum.GetNames(typeof(AnimalGender));
                var textExpectedGenderValues = string.Join(", ", expectedGenderValues);
                return Result<Pet>.Failure($"The provided gender {gender} is not one from the possible races: {textExpectedGenderValues}");
            }

            var pet = new Pet
            {
                Id = Guid.NewGuid(),
                Name = name,
                Age = age,
                Race = animalRace,
                Gender = animalGender
            };

            return Result<Pet>.Success(pet);
        }

        public void RegisterPetToClinic(VetClinic clinic)
        {
            ClinicId = clinic.Id;
        }

        public void ConnectToOwner(PetOwner petOwner)
        {
            OwnerId = petOwner.Id;
        }
    }
}
