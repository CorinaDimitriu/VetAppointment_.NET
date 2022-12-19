using AutoMapper;
using VetAppointment.Application.Commands.VetClinics;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Mappers
{
    public class VetClinicMapperProfile : Profile
    {
        public VetClinicMapperProfile()
        {
            CreateMap<VetClinic, VetClinicResponse>();
            CreateMap<CreateVetClinicCommand, VetClinic>();
        }
    }
}
