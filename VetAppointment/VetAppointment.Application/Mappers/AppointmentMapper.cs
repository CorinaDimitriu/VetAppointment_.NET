﻿using AutoMapper;

#nullable disable
namespace VetAppointment.Application.Mappers
{
    public static class AppointmentMapper
    {
        private static readonly Lazy<IMapper> Lazy =
            new(() =>
            {
                var config = new MapperConfiguration(cfg =>
                {
                    cfg.ShouldMapProperty = p => p.GetMethod.IsPublic || p.GetMethod.IsAssembly;
                    cfg.AddProfile<AppointmentMapperProfile>();
                });
                var mapper = config.CreateMapper();
                return mapper;
            });

        public static IMapper Mapper => Lazy.Value;
    }
}
