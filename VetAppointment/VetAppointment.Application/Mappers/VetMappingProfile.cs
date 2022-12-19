using AutoMapper;
using VetAppointment.Application.Commands.Vets;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Mappers
{
    public class VetMappingProfile : Profile
    {
        public VetMappingProfile()
        {
            CreateMap<Vet, VetResponse>().ReverseMap();
            CreateMap<CreateVetCommand, Vet>();
        }
    }
}
