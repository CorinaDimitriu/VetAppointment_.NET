using AutoMapper;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.Domain;

namespace VetAppointment.API.Mappers
{
    public class VetClinicMapperProfile : Profile
    {
        public VetClinicMapperProfile()
        {
            CreateMap<VetClinic, VetClinicDto>();
            CreateMap<CreateVetClinicDto, VetClinic>();
        }
    }
}
