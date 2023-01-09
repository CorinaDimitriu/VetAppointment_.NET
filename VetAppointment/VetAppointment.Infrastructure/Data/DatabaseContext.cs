using Microsoft.EntityFrameworkCore;
using System.Reflection.Metadata;
using VetAppointment.Application;
using VetAppointment.Domain;

namespace VetAppointment.Infrastructure.Data
{
    public class DatabaseContext : DbContext, IDatabaseContext
    {
        public DatabaseContext(DbContextOptions options) : base(options)
        {
            Database.EnsureCreated();
        }
        public DbSet<Account> Accounts => Set<Account>();
        public DbSet<Pet> Pets => Set<Pet>();
        public DbSet<Vet> Vets => Set<Vet>();
        public DbSet<PetOwner> PetOwners => Set<PetOwner>();
        public DbSet<VetClinic> VetClinics => Set<VetClinic>();
        public DbSet<Appointment> Appointments => Set<Appointment>();
        public DbSet<Drug> Drugs => Set<Drug>();
        public DbSet<MedicalHistory> MedicalHistories => Set<MedicalHistory>();
        public DbSet<Treatment> Treatments => Set<Treatment>();
        public DbSet<PrescribedDrug> PrescribedDrugs => Set<PrescribedDrug>();
        
        public void Save() => SaveChanges();
    }
}