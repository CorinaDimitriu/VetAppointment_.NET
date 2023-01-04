using Microsoft.AspNetCore.Mvc.Versioning;
using VetAppointment.API;
using VetAppointment.Application;
using VetAppointment.Infrastructure;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Net.Http.Headers;
using Microsoft.AspNetCore.Builder;

var builder = WebApplication.CreateBuilder(args);


// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
    {
        options.SwaggerDoc("v1", new Microsoft.OpenApi.Models.OpenApiInfo() 
            { 
                Title = "Api version  1", Version = "1", Description = "V1", 
            }
        );
        options.SwaggerDoc("v2", new Microsoft.OpenApi.Models.OpenApiInfo() 
            { 
                Title = "Api version  2", Version = "2", Description = "V2 - With MediatR", 
            }
        );
    }
);

builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(builder =>
    {
        builder.WithOrigins("https://localhost:7029").
        WithMethods("GET", "POST", "PUT", "DELETE").WithHeaders("Content-Type", "x-requested-with", "Authorization");
    });

    options.AddPolicy(name: "clinicsCors", builder =>
    {
        builder.WithOrigins("https://localhost:7029").
        WithMethods("GET", "POST", "PUT", "DELETE").WithHeaders("Content-Type", "x-requested-with", "Authorization");
    });
});

builder.Services.AddApiVersioning(options =>
    {
        options.AssumeDefaultVersionWhenUnspecified = true;
        options.DefaultApiVersion = new Microsoft.AspNetCore.Mvc.ApiVersion(1, 0);
        options.ReportApiVersions = true;
        options.ApiVersionReader = ApiVersionReader.Combine
            (
                new QueryStringApiVersionReader("api-version"),
                new HeaderApiVersionReader("X-version"),
                new MediaTypeApiVersionReader("ver")
            );
    }
);

builder.Services.AddVersionedApiExplorer(options =>
    {
        options.GroupNameFormat = "'v'VVV";
        options.SubstituteApiVersionInUrl = true;
    }
);

builder.Services.AddControllers();
builder.Services.AddApplicationServices();
builder.Services.AddAPIServices();
builder.Services.AddInfrastrutureServices(builder.Configuration);
builder.Services.AddHealthChecks();

builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
{
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateAudience = true,
        ValidAudience = "https://localhost:7029",
        ValidateIssuer = true,
        ValidIssuer = "https://localhost:7029",
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(File.ReadAllText("key"))),
        ClockSkew = TimeSpan.Zero
    };

    //options.Events = new JwtBearerEvents
    //{
    //    OnMessageReceived = context =>
    //    {
    //        context.Token = context.Request.Cookies[".AspNetCore.Cookies"];
    //        return Task.CompletedTask;
    //    }
    //};

});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
	app.UseSwagger();
    app.UseSwaggerUI(options =>
        {
            options.SwaggerEndpoint($"/swagger/v1/swagger.json", $"v1");
            options.SwaggerEndpoint($"/swagger/v2/swagger.json", $"v2");
        }
    );
}

app.UseHttpsRedirection();
app.UseCors("clinicsCors");
app.UseHealthChecks("/health");

app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();

app.UseCookiePolicy(new CookiePolicyOptions
    {
        MinimumSameSitePolicy = SameSiteMode.Strict,
    });

app.MapControllers();

app.Run();











