using AutoMapper;
using VetAppointment.Application.Commands.PetOwners;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Mappers
{
    public class PetOwnerMapperProfile : Profile
    {
        public PetOwnerMapperProfile()
        {
            CreateMap<PetOwner, PetOwnerResponse>().ReverseMap();
            CreateMap<PetOwner, CreatePetOwnerCommand>().ReverseMap();
        }
    }
}
