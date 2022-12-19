using AutoMapper;
using VetAppointment.Application.Commands.Pets;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Mappers
{
    public class PetMapperProfile : Profile
    {
        public PetMapperProfile()
        {
            CreateMap<Pet, PetResponse>().ReverseMap();
            CreateMap<Pet, CreatePetCommand>().ReverseMap();
        }
    }
}
