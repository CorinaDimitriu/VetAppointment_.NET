using AutoMapper;
using VetAppointment.Application.Commands;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Mappers
{
    public class PetMappingProfile : Profile
    {
        public PetMappingProfile()
        {
            CreateMap<Pet, PetResponse>().ReverseMap();
            CreateMap<Pet, CreatePetCommand>().ReverseMap();
        }
    }
}
