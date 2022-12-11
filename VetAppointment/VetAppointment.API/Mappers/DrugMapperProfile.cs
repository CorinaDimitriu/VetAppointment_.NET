using AutoMapper;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.Domain;

namespace VetAppointment.API.Mappers
{
    public class DrugMapperProfile : Profile
    {
        public DrugMapperProfile()
        {
            CreateMap<Drug, DrugDto>();
            CreateMap<CreateDrugDto, Drug>();
        }
    }
}
