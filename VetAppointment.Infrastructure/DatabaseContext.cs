using Microsoft.EntityFrameworkCore;
using VetAppointment.Application;
using VetAppointment.Domain.Models;

namespace VetAppointment.Infrastructure
{
    public class DatabaseContext : DbContext, IDatabaseContext
    {
        public DbSet<Pet> Pets => Set<Pet>();
        public DbSet<VetClinic> Clinics => Set<VetClinic>();

        public DbSet<PetOwner> PetOwners => Set<PetOwner>();

        public DbSet<Appointment> Appointments => Set<Appointment>();
        public DbSet<VetClinic> VetClinics => Set<VetClinic>();
        public DbSet<Vet> Vets => Set<Vet>();

        public void Save()
        {
            this.SaveChanges();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlite("Data Source = VetAppointment.db");
        }

        //protected override void OnModelCreating(ModelBuilder modelBuilder)
        //{
        //    var appleClinic = VetClinic.Create("Apple",
        //        "Apple Avenue", 100, "apple@apple.com", "+40712345678").Entity;
        //    var cinnamonClinic = VetClinic.Create("Cinnamon",
        //        "Cinammon Avenue", 200, "cinnamon@cinnamon.com", "+40778945612").Entity;
        //    modelBuilder.Entity<VetClinic>().HasData(new List<VetClinic> { appleClinic, cinnamonClinic });
        //}
    }
}
