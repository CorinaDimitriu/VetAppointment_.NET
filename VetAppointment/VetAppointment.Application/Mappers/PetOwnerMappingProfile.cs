using AutoMapper;
using VetAppointment.Application.Commands;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.API.Mappers
{
    public class PetOwnerMappingProfile : Profile
    {
        public PetOwnerMappingProfile() 
        {
            CreateMap<PetOwner, PetOwnerResponse>().ReverseMap();
            CreateMap<CreatePetOwnerCommand, PetOwner>().ReverseMap();
        }
    }
}
