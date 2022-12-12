#nullable disable
using AutoMapper;

namespace VetAppointment.API.Mappers
{
    public class VetClinicMapper
    {
        private static readonly Lazy<IMapper> Lazy =
            new(() =>
            {
                var config = new MapperConfiguration(cfg =>
                {
                    cfg.ShouldMapProperty = p =>
                    p.GetMethod.IsPublic ||
                    p.GetMethod.IsAssembly;
                    cfg.AddProfile<VetClinicMapperProfile>();
                });
                var mapper = config.CreateMapper();
                return mapper;
            });

        public static IMapper Mapper => Lazy.Value;
    }
}
