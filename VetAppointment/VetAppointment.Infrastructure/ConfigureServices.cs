using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using VetAppointment.Application;
using VetAppointment.Domain;
using VetAppointment.Infrastructure.Data;
using VetAppointment.Infrastructure.Repositories;
using VetAppointment.Infrastructure.Repositories.GenericRepositories;

namespace VetAppointment.Infrastructure
{
    public static class ConfigureServices
    {
        public static IServiceCollection AddInfrastrutureServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<DatabaseContext>(
                options =>
                {
                    options.UseSqlite(
                        configuration.GetConnectionString("DefaultConnection"),
                        b => b.MigrationsAssembly(typeof(DatabaseContext).Assembly.FullName)
                    );
                    options.UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking);
                    options.EnableSensitiveDataLogging();
                }
            );

            services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
            services.AddScoped(typeof(IUnitOfWork), typeof(UnitOfWork));
            services.AddScoped<IRepository<Appointment>, AppointmentRepository>();
            services.AddScoped<IRepository<Account>, AccountRepository>();
            services.AddScoped<IRepository<PetOwner>, PetOwnerRepository>();
            services.AddScoped<IRepository<Pet>, PetRepository>();
            services.AddScoped<IRepository<VetClinic>, VetClinicRepository>();
            services.AddScoped<IRepository<Vet>, VetRepository>();
            services.AddScoped<IRepository<Drug>, DrugRepository>();
            services.AddScoped<IRepository<MedicalHistory>, MedicalHistoryRepository>();
            services.AddScoped<IRepository<PrescribedDrug>, PrescribedDrugRepository>();
            services.AddScoped<IRepository<Treatment>, TreatmentRepository>();

            return services;
        }
    }
}
