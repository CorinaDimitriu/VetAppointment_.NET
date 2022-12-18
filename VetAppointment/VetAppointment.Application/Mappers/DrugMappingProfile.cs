using AutoMapper;
using VetAppointment.Application.Commands;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Mappers
{
    public class DrugMappingProfile : Profile
    {
        public DrugMappingProfile() 
        {
            CreateMap<Drug,DrugResponse>().ReverseMap();
            CreateMap<Drug,CreateDrugCommand>().ReverseMap();
        }
    }
}
