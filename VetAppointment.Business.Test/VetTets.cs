using System.Numerics;
using VetAppointment.Business.Enums;

namespace VetAppointment.Business.Test
{
    public class VetTets
    {
        [Fact]
        public void When_CreateVetWithValidData_Then_ShouldReturnSuccess()
        {
            // Arrange
            var vet = CreateSUT();

            //Act
            var result = Vet.Create(vet.Item1, vet.Item2, vet.Item3, vet.Item4, vet.Item5, vet.Item6);

            //Assert
            result.IsSuccess.Should().BeTrue();
            result.Entity.Should().NotBeNull();
            result.Entity.Id.Should().NotBeEmpty();
            result.Entity.Name.Should().Be(vet.Item1);
            result.Entity.Surname.Should().Be(vet.Item2);
            result.Entity.Birthdate.Should().Be(vet.Item3);
            result.Entity.Gender.Should().Be(Enum.Parse<PersonGender>(vet.Item4));
            result.Entity.Phone.Should().Be(vet.Item6);
            result.Entity.Email.Should().Be(vet.Item5);
        }
 

        [Fact]
        public void When_CreateVetWithInvalidPhoneNumber_Then_ShouldReturnFailure()
        {
            // Arrange
            var vet = CreateSUT();
            var invalidPhoneNumber = string.Empty;

            //Act
            var result = Vet.Create(vet.Item1, vet.Item2, vet.Item3, vet.Item4, vet.Item5, invalidPhoneNumber);

            //Assert
            result.IsFailure.Should().BeTrue();
            result.Error.Should().Be($"Phone number {invalidPhoneNumber} is not valid");
        }

        [Fact]
        public void When_CreateVetWithInvalidEmail_Then_ShouldReturnFailure()
        {
            // Arrange
            var vet = CreateSUT();
            var invalidEmail = string.Empty;

            //Act
            var result = Vet.Create(vet.Item1, vet.Item2, vet.Item3, vet.Item4, invalidEmail, vet.Item6);

            //Assert
            result.IsFailure.Should().BeTrue();
            result.Error.Should().Be($"Email {invalidEmail} is not valid");
        }

        [Fact]
        public void When_CreateVetWithInvalidGender_Then_ShouldReturnFailure()
        {
            // Arrange
            var vet = CreateSUT();
            var invalidGender = "invalid";

            //Act
            var result = Vet.Create(vet.Item1, vet.Item2, vet.Item3, invalidGender, vet.Item5, vet.Item6);

            //Assert
            result.IsFailure.Should().BeTrue();
            result.Error.Should().Be($"The provided gender {invalidGender} is not one from the possible races: Male, Female, Other");
        }

        //string name, string surname, string birthdate, string gender, string email, string phone
        private static Tuple<string, string, string, string, string, string> CreateSUT()
        {
            var firstName = "John";
            var lastName = "Doe";
            var birthdate = "01/01/1990";
            string gender = "Male";
            string email = "john.doe@gmail.com";
            string phone = "+40123456789";

            return new Tuple<string, string, string, string, string, string>(firstName, lastName, birthdate, gender, email, phone);
        }
    }
}
