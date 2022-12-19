using FluentValidation;
using FluentValidation.AspNetCore;
using System.Reflection;

namespace VetAppointment.API
{
    public static class ConfigureServices
    {
        public static IServiceCollection AddAPIServices (this IServiceCollection services)
        {
            services.AddFluentValidationAutoValidation();
            services.AddValidatorsFromAssembly(Assembly.GetExecutingAssembly());
            return services;

        }
    }
}
