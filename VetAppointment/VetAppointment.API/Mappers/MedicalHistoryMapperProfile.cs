using AutoMapper;
using VetAppointment.API.Dtos;
using VetAppointment.Domain;

namespace VetAppointment.API.Mappers
{
    public class MedicalHistoryMapperProfile : Profile
    {
        public MedicalHistoryMapperProfile()
        {
            CreateMap<MedicalHistory, MedicalHistoryDto>();
            CreateMap<MedicalHistoryDto, MedicalHistory>();
        }
    }
}
