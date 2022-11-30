using Microsoft.AspNetCore.Mvc.Testing;
using VetAppointment.API.Controllers;
using VetAppointment.Infrastructure.Data;

namespace VetAppointment.Integration.Test
{
    public class BaseIntegrationTests
    {
        protected HttpClient HttpClient { get; private set; }
        protected BaseIntegrationTests()
        {
            HttpClient = new WebApplicationFactory<VetClinicsController>().WithWebHostBuilder(builder => { }).CreateClient();
            CleanDatabases();
        }

        private static void CleanDatabases()
        {
            var databaseContext = new DatabaseContext_Tests();
            //var databaseContext = new DatabaseContext();

            databaseContext.Pets_Tests.RemoveRange(databaseContext.Pets_Tests.ToList());
            databaseContext.Vets_Tests.RemoveRange(databaseContext.Vets_Tests.ToList());
            databaseContext.PetOwners_Tests.RemoveRange(databaseContext.PetOwners_Tests.ToList());
            databaseContext.VetClinics_Tests.RemoveRange(databaseContext.VetClinics_Tests.ToList());
            databaseContext.Appointments_Tests.RemoveRange(databaseContext.Appointments_Tests.ToList());

            databaseContext.Save();
        }
    }
}
