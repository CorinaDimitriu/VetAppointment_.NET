﻿using AutoMapper;

#nullable disable
namespace VetAppointment.API.Mappers
{
    public static class PetMapper
    {
        private static readonly Lazy<IMapper> Lazy =
            new(() =>
            {
                var config = new MapperConfiguration(cfg =>
                {
                    cfg.ShouldMapProperty = p =>
                    p.GetMethod.IsPublic ||
                    p.GetMethod.IsAssembly;
                    cfg.AddProfile<PetMappingProfile>();
                });
                var mapper = config.CreateMapper();
                return mapper;
            });
        
        public static IMapper Mapper => Lazy.Value;
    }
}
