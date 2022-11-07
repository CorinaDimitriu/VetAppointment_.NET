using Microsoft.EntityFrameworkCore;
using VetAppointment.Business;

namespace VetAppointment.API.Data
{
    public class DatabaseContext : DbContext
    {
        public DbSet<Pet> Pets { get; set; } 
        public DbSet<VetClinic> Clinics { get; set; }
        
        public DbSet<PetOwner> PetOwners { get; set; }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlite("Data Source = VetAppointment.db");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            var appleClinic = VetClinic.Create("Apple",
                "Apple Avenue", 100, "apple@apple.com", "+40712345678").Entity;
            var cinnamonClinic = VetClinic.Create("Cinnamon",
                "Cinammon Avenue", 200, "cinnamon@cinnamon.com", "+40778945612").Entity;
            modelBuilder.Entity<VetClinic>().HasData(new List<VetClinic> { appleClinic, cinnamonClinic });
        }
    }
}
