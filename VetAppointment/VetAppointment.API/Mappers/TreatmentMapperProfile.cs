using AutoMapper;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.Domain;

namespace VetAppointment.API.Mappers
{
    public class TreatmentMapperProfile : Profile
    {
        public TreatmentMapperProfile()
        {
            CreateMap<Treatment, TreatmentDto>();
            CreateMap<CreateTreatmentDto, Treatment>();
        }
    }
}
