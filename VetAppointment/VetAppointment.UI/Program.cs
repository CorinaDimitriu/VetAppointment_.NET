using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using Smart.Blazor;
using VetAppointment.UI;
using VetAppointment.UI.Pages.Services;

var builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

builder.Services.AddHttpClient<IPetDataService, PetDataService>
    (
        client => client.BaseAddress = new Uri(builder.HostEnvironment.BaseAddress)
    );
builder.Services.AddHttpClient<IVetDataService, VetDataService>
    (
        client => client.BaseAddress = new Uri(builder.HostEnvironment.BaseAddress)
    );
builder.Services.AddHttpClient<IVetClinicDataService, VetClinicDataService>
    (
        client => client.BaseAddress = new Uri(builder.HostEnvironment.BaseAddress)
    );
builder.Services.AddHttpClient < IPetOwnerDataService, PetOwnerDataService>
    (
        client => client.BaseAddress = new Uri(builder.HostEnvironment.BaseAddress)
    );
builder.Services.AddHttpClient<IAppointmentDataService, AppointmentDataService>
    (
        client => client.BaseAddress = new Uri(builder.HostEnvironment.BaseAddress)
    );
builder.Services.AddHttpClient<IDrugDataService, DrugDataService>
    (
        client => client.BaseAddress = new Uri(builder.HostEnvironment.BaseAddress)
    );
builder.Services.AddHttpClient<IPrescribedDrugDataService, PrescribedDrugDataService>
    (
        client => client.BaseAddress = new Uri(builder.HostEnvironment.BaseAddress)
    );
builder.Services.AddHttpClient<ITreatmentDataService, TreatmentDataService>
    (
        client => client.BaseAddress = new Uri(builder.HostEnvironment.BaseAddress)
    );

builder.Services.AddSmart();
builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress) });
await builder.Build().RunAsync();
