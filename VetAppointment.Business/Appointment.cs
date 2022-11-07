using VetAppointment.Business.Helpers;

namespace VetAppointment.Business
{
    public class Appointment
    {
        public Guid Id { get; private set; }
        public Guid VetId { get; private set; }
        public Guid PetId { get; private set; }

        public DateTime ScheduledDate;

        public int EstimatedDurationInMinutes;


        public static Result<Appointment> SettleAppointment(Guid vetId, Guid petId, DateTime date, int duration)
        {

            if (vetId == Guid.Empty)
            {
                return Result<Appointment>.Failure($"Vet id cannot be empty");
            }

            if (petId == Guid.Empty)
            {
                return Result<Appointment>.Failure($"Pet id cannot be empty");
            }

            if (duration <= 0)
            {
                return Result<Appointment>.Failure($"Duration cannot be less than 0");
            }

            if (date < DateTime.Now)
            {
                return Result<Appointment>.Failure($"Date cannot be in the past");
            }

            var appointment = new Appointment
            {
                Id = Guid.NewGuid(),
                VetId = vetId,
                PetId = petId,
                ScheduledDate = date,
                EstimatedDurationInMinutes = duration
            };

            return Result<Appointment>.Success(appointment);
        }
    }
}
