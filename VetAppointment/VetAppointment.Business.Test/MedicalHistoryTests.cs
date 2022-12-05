namespace VetAppointment.Business.Test
{
    public class MedicalHistoryTests
    {
        [Fact]
        public void When_CreateMedicalHistory_Then_ShouldReturnMedicalHistory()
        {
            // Arrange

            // Act
            var result = MedicalHistory.Create();

            // Assert
            result.IsSuccess.Should().BeTrue();
            result.Entity.Should().NotBeNull();
        }

        [Fact]
        public void When_RegisterAppointmentToMedicalHistory_Then_ShouldReturnSuccess()
        {
            // Arrange
            var medicalHistory = MedicalHistory.Create().Entity;
            var sutAppointment = CreateSUTForAppointment();
            var appointment = Appointment.SettleAppointment(sutAppointment.Item1, sutAppointment.Item2, sutAppointment.Item3, sutAppointment.Item4).Entity;

            // Act
            var result = medicalHistory.RegisterAppointmentToHistory(appointment);

            // Assert
            result.IsSuccess.Should().BeTrue();
        }

        [Fact]
        public void When_RegisterNullAppointmentToMedicalHistory_Then_ShouldReturnFailure()
        {
            // Arrange
            var medicalHistory = MedicalHistory.Create().Entity;
            
            // Act
            var result = medicalHistory.RegisterAppointmentToHistory(null);

            // Assert
            result.IsFailure.Should().BeTrue();
        }

        [Fact]
        public void When_AttachMedicalHistoryToClinic_Then_IdShouldNotBeNull()
        {
            // Arrange
            var medicalHistory = MedicalHistory.Create().Entity;
            var sutClinic = CreateSUTForClinic();
            var clinic = VetClinic.Create(sutClinic.Item1, sutClinic.Item2, sutClinic.Item3, sutClinic.Item4, sutClinic.Item5).Entity;

            // Act
            medicalHistory.AttachToClinic(clinic.Id);

            // Assert
            medicalHistory.ClinicId.Should().Be(clinic.Id);
        }

        public static Tuple<Guid, Guid, DateTime, int> CreateSUTForAppointment()
        {
            return new Tuple<Guid, Guid, DateTime, int>(Guid.NewGuid(), Guid.NewGuid(), DateTime.Now.AddDays(1), 30);
        }

        private Tuple<string, string, int, string, string> CreateSUTForClinic()
        {
            return new Tuple<string, string, int, string, string>("Vet Clinic", "Address", 10, "email@gmail.com", "+40123456789");
        }
    }
}
