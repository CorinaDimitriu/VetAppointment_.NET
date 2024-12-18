﻿using VetAppointment.Domain.Helpers;

#nullable disable
namespace VetAppointment.Domain
{
    public class Appointment
    {
        public Guid Id { get; private set; }
        public Guid VetId { get; private set; }
        public Guid PetId { get; private set; }
        public DateTime ScheduledDate { get; private set; }
        public int EstimatedDurationInMinutes { get; private set; }
        public Guid TreatmentId { get; private set; }

        public static Result<Appointment> SettleAppointment(Vet vet, Pet pet, string dateString, int duration)
        {
            Guid vetId = vet.Id;
            Guid petId = pet.Id;

            if (duration <= 0)
            {
                return Result<Appointment>.Failure($"Duration cannot be less than 0");
            }

            if (!DateTime.TryParse(dateString, out DateTime date))
            {
                return Result<Appointment>.Failure($"Invalid birthdate - {dateString}!");
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
                EstimatedDurationInMinutes = duration,
            };

            return Result<Appointment>.Success(appointment);
        }

        public void AttachTreatmentToAppointment(Treatment treatment)
        {
            TreatmentId = treatment.Id;
        }
    
        public Result Update(Guid vetId, Guid petId, string scheduledDateString, int estimatedDurationInMinutes,
            Guid treatmentId)
        {
            if (estimatedDurationInMinutes <= 0)
            {
                return Result.Failure($"Duration cannot be less than 0");
            }

            if (!DateTime.TryParse(scheduledDateString, out DateTime scheduledDate))
            {
                return Result.Failure($"Invalid birthdate - {scheduledDateString}!");
            }

            if (scheduledDate < DateTime.Now)
            {
                return Result.Failure($"Date cannot be in the past");
            }

            VetId = vetId;
            PetId = petId;
            ScheduledDate = scheduledDate;
            EstimatedDurationInMinutes = estimatedDurationInMinutes;
            TreatmentId = treatmentId;

            return Result.Success();
        }
    }
}
