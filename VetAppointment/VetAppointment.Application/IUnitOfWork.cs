﻿using VetAppointment.Domain;

namespace VetAppointment.Application
{
    public interface IUnitOfWork
    {
        IRepository<Appointment> AppointmentRepository { get; }
        IRepository<Account> AccountRepository { get; }
        IRepository<Drug> DrugRepository { get; }
        IRepository<MedicalHistory> MedicalHistoryRepository { get; }
        IRepository<PetOwner> PetOwnerRepository { get; }
        IRepository<Pet> PetRepository { get; }
        IRepository<PrescribedDrug> PrescribedDrugRepository { get; }
        IRepository<Treatment> TreatmentRepository { get; }
        IRepository<VetClinic> VetClinicRepository { get; }
        IRepository<Vet> VetRepository { get; }

        Task SaveChanges();
    }
}