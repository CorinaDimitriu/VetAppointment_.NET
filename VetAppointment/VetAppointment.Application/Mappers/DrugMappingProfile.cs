using AutoMapper;
using VetAppointment.Application.Commands.Drugs;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Mappers
{
    public class DrugMappingProfile : Profile
    {
        public DrugMappingProfile()
        {
            CreateMap<Drug, DrugResponse>().ReverseMap();
            CreateMap<Drug, CreateDrugCommand>().ReverseMap();
            CreateMap<Drug, UpdateDrugCommand>().ReverseMap();
        }
    }
}
