using AutoMapper;
using VetAppointment.Application.Commands.Appointments;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Mappers
{
    public class AppointmentMapperProfile : Profile
    {
        public AppointmentMapperProfile()
        {
            CreateMap<Appointment, AppointmentResponse>().ReverseMap();
            CreateMap<Appointment, CreateAppointmentCommand>().ReverseMap();
        }
    }
}
