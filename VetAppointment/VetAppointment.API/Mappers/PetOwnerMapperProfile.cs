using AutoMapper;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.Domain;

namespace VetAppointment.API.Mappers
{
    public class PetOwnerMapperProfile : Profile
    {
        public PetOwnerMapperProfile() 
        {
            CreateMap<PetOwner, PetOwnerDto>();
            CreateMap<CreatePetOwnerDto, PetOwner>();
        }
    }
}
