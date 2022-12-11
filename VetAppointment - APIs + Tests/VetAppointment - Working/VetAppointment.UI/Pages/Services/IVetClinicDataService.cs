using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Services
{
    public interface IVetClinicDataService
    {
        Task<IEnumerable<VetClinic>> GetAllClinics();
        Task<VetClinic> AddClinic(VetClinic clinic);
        Task<VetClinic> GetClinicById(Guid id);
        Task<string> AddVetToClinic(Guid clinicId, ModelVet vet);
        Task<string> DeleteClinicById(Guid clinicId);
        Task<string> AddPetsToClinic(Guid clinicId, List<Pet> pets);

        Task<string> UpdateClinic(Guid clinicId, ModelClinic clinic);
    }
}
