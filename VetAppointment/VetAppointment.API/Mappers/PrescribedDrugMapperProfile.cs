using AutoMapper;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.Domain;

namespace VetAppointment.API.Mappers
{
    public class PrescribedDrugMapperProfile : Profile
    {
        public PrescribedDrugMapperProfile()
        {
            CreateMap<PrescribedDrug, PrescribedDrugDto>();
            CreateMap<CreatePrescribedDrugDto, PrescribedDrug>();
        }
    }
}
