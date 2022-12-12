using AutoMapper;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.Domain;

namespace VetAppointment.API.Mappers
{
    public class VetMappingProfile : Profile
    {
        public VetMappingProfile()
        {
            CreateMap<Vet, VetDto>();
            CreateMap<CreateVetDto, Vet>();
        }
    }
}
