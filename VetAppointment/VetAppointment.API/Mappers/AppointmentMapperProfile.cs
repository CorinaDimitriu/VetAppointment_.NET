using AutoMapper;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.Domain;

namespace VetAppointment.API.Mappers
{
    public class AppointmentMapperProfile : Profile
    {
        public AppointmentMapperProfile()
        {
            CreateMap<Appointment, AppointmentDto>();
            CreateMap<CreateAppointmentDto, Appointment>();
        }
    }
}
