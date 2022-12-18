using AutoMapper;
using VetAppointment.Application.Commands;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.API.Mappers
{
    public class PetOwnerMapperProfile : Profile
    {
        public PetOwnerMapperProfile() 
        {
            CreateMap<PetOwner, PetOwnerResponse>().ReverseMap();
            CreateMap<CreatePetOwnerCommand, PetOwner>().ReverseMap();
        }
    }
}
