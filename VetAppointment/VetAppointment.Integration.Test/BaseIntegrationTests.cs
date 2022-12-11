using Microsoft.AspNetCore.Mvc.Testing;
using VetAppointment.API.Controllers;
using VetAppointment.Infrastructure.Data;

namespace VetAppointment.Integration.Tests
{
    public class BaseIntegrationTests : IClassFixture<WebApplicationFactory<VetClinicsController>>
    {
        protected readonly WebApplicationFactory<VetClinicsController> _factory;
        protected BaseIntegrationTests(WebApplicationFactory<VetClinicsController> factory)
        {
            _factory = factory;
        }

        protected static void CleanDatabases(DatabaseContext databaseContext)
        {
            databaseContext.PetOwners.RemoveRange(databaseContext.PetOwners.ToList());
            databaseContext.VetClinics.RemoveRange(databaseContext.VetClinics.ToList());
            databaseContext.Appointments.RemoveRange(databaseContext.Appointments.ToList());
            databaseContext.Pets.RemoveRange(databaseContext.Pets.ToList());
            databaseContext.Vets.RemoveRange(databaseContext.Vets.ToList());
            databaseContext.Drugs.RemoveRange(databaseContext.Drugs.ToList());
            databaseContext.PrescribedDrugs.RemoveRange(databaseContext.PrescribedDrugs.ToList());
            databaseContext.Treatments.RemoveRange(databaseContext.Treatments.ToList());
            databaseContext.MedicalHistories.RemoveRange(databaseContext.MedicalHistories.ToList());
            databaseContext.SaveChanges();
        }
    }
}
