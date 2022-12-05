namespace VetAppointment.Business.Test
{
    public class VetClinicTests
    {
        [Fact]
        public void When_CreateVetClinicWithValidData_Then_ShouldReturnSucceed()
        {
            // Arrange
            var vet = CreateSUT();

            //Act
            var result = VetClinic.Create(vet.Item1, vet.Item2, vet.Item3, vet.Item4, vet.Item5);

            //Assert
            result.IsSuccess.Should().BeTrue();
            result.Entity.Should().NotBeNull();
            result.Entity.Id.Should().NotBeEmpty();
            result.Entity.Name.Should().Be(vet.Item1);
            result.Entity.Address.Should().Be(vet.Item2);
            result.Entity.NumberOfPlaces.Should().Be(vet.Item3);
            result.Entity.ContactEmail.Should().Be(vet.Item4);
            result.Entity.ContactPhone.Should().Be(vet.Item5);
        }

        [Fact]
        public void When_CreateVetClinicWithInvalidNumberOfPlaces_Then_ShouldReturnFailure()
        {
            // Arrange
            var vet = CreateSUT();
            var invalidNumberOfPlaces = -1;

            //Act
            var result = VetClinic.Create(vet.Item1, vet.Item2, invalidNumberOfPlaces, vet.Item4, vet.Item5);

            //Assert
            result.IsFailure.Should().BeTrue();
            result.Error.Should().Be($"The number of places for the shelter needs to be greater than '{0}'");
        }

        [Fact]
        public void When_CreateVetClinicWithInvalidEmail_Then_ShouldReturnFailure()
        {
            // Arrange
            var vet = CreateSUT();
            var invalidEmail = "invalidEmail";

            //Act
            var result = VetClinic.Create(vet.Item1, vet.Item2, vet.Item3, invalidEmail, vet.Item5);

            //Assert
            result.IsFailure.Should().BeTrue();
            result.Error.Should().Be($"Email {invalidEmail} is not valid");
        }

        [Fact]
        public void When_CreateVetClinicWithInvalidPhoneNumber_Then_ShouldReturnFailure()
        {
            // Arrange
            var vet = CreateSUT();
            var invalidPhoneNumber = "invalidPhoneNumber";

            //Act
            var result = VetClinic.Create(vet.Item1, vet.Item2, vet.Item3, vet.Item4, invalidPhoneNumber);

            //Assert
            result.IsFailure.Should().BeTrue();
            result.Error.Should().Be($"Phone number {invalidPhoneNumber} is not valid");
        }

        [Fact]
        public void When_AttachMedicalHistoryToClinic_Then_IdShouldNotBeNull()
        {
            // Arrange
            var medicalHistory = MedicalHistory.Create().Entity;
            var sut = CreateSUT();
            var clinic = VetClinic.Create(sut.Item1, sut.Item2, sut.Item3, sut.Item4, sut.Item5).Entity;

            // Act
            clinic.AttachMedicalHistory(medicalHistory.Id);

            // Assert
            clinic.MedicalHistoryId.Should().Be(medicalHistory.Id);
        }

        [Fact]
        public void When_RegisterPetFamilyToClinic_Then_ShouldReturnSuccess()
        {
            // Arrange
            var sut = CreateSUT();
            var clinic = VetClinic.Create(sut.Item1, sut.Item2, sut.Item3, sut.Item4, sut.Item5).Entity;
            var sutPet = CreateSUTForPet();
            var pet = Pet.Create(sutPet.Item1, sutPet.Item2, sutPet.Item3, sutPet.Item4).Entity;
            var pets = new List<Pet>();
            pets.Add(pet);

            // Act
            var result = clinic.RegisterPetsFamilyToClinic(pets);

            // Assert
            result.IsSuccess.Should().BeTrue();
        }

        [Fact]
        public void When_RegisterNullPetFamilyToClinic_Then_ShouldReturnFailure()
        {
            // Arrange
            var sut = CreateSUT();
            var clinic = VetClinic.Create(sut.Item1, sut.Item2, sut.Item3, sut.Item4, sut.Item5).Entity;
            var pets = new List<Pet>();

            // Act
            var result = clinic.RegisterPetsFamilyToClinic(pets);

            // Assert
            result.IsFailure.Should().BeTrue();
        }

        [Fact]
        public void When_RegisterPetFamilyToOcupiedClinic_Then_ShouldReturnFailure()
        {
            // Arrange
            var sut = CreateSUT();
            var clinic = VetClinic.Create(sut.Item1, sut.Item2, 1, sut.Item4, sut.Item5).Entity;
            var sutPet = CreateSUTForPet();
            var pet1 = Pet.Create(sutPet.Item1, sutPet.Item2, sutPet.Item3, sutPet.Item4).Entity;
            var pet2 = Pet.Create(sutPet.Item1, sutPet.Item2, sutPet.Item3, sutPet.Item4).Entity;
            var pets = new List<Pet>();
            pets.Add(pet1);
            pets.Add(pet2);

            // Act
            var result = clinic.RegisterPetsFamilyToClinic(pets);

            // Assert
            result.IsFailure.Should().BeTrue();
        }

        //string name, string address, int numberOfPlaces, string contactEmail, string contactPhone
        private Tuple<string, string, int, string, string> CreateSUT()
        {
            return new Tuple<string, string, int, string, string>("Vet Clinic", "Address", 10, "email@gmail.com", "+40123456789");
        }
        private Tuple<string, string, string, string> CreateSUTForPet()
        {
            return new Tuple<string, string, string, string>("Pisacio", "12/06/2020", "Cat", "Male");
        }
    }
}
