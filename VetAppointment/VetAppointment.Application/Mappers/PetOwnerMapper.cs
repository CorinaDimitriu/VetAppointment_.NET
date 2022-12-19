#nullable disable
using AutoMapper;

namespace VetAppointment.API.Mappers
{
    public static class PetOwnerMapper
    {
        private static readonly Lazy<IMapper> Lazy =
            new(() =>
            {
                var config = new MapperConfiguration(cfg =>
                {
                    cfg.ShouldMapProperty = p =>
                    p.GetMethod.IsPublic ||
                    p.GetMethod.IsAssembly;
                    cfg.AddProfile<PetOwnerMappingProfile>();
                });
                var mapper = config.CreateMapper();
                return mapper;
            });

        public static IMapper Mapper => Lazy.Value;
    }
}
