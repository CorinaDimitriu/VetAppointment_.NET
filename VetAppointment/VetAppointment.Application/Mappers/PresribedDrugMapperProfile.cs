using AutoMapper;
using VetAppointment.Application.Commands.PrescribedDrug;
using VetAppointment.Application.Response;
using VetAppointment.Domain;

namespace VetAppointment.Application.Mappers
{
    public class PresribedDrugMapperProfile : Profile
    {
        public PresribedDrugMapperProfile()
        {
            CreateMap<PrescribedDrug, PrescribedDrugResponse>();
            CreateMap<CreatePrescribedDrugCommand, PrescribedDrug>();
        }
    }
}
