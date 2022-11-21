using Microsoft.EntityFrameworkCore;
using VetAppointment.Domain.Models;

namespace VetAppointment.Application
{
    public interface IDatabaseContext
    {
        DbSet<VetClinic> Clinics { get; }
        DbSet<PetOwner> PetOwners { get; }
        DbSet<Appointment> Appointments { get; }
        DbSet<Pet> Pets { get; }
        DbSet<VetClinic> VetClinics { get; }
        DbSet<Vet> Vets { get; }

        public void Save();
    }
}