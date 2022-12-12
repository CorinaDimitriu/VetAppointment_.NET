using System.Net.Http;
using System.Text;
using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Services
{
    public interface IVetClinicDataService
    {
        Task<IEnumerable<VetClinic>> GetAllClinics();
        Task<VetClinic> AddClinic(VetClinic clinic);
        Task<VetClinic> GetClinicById(Guid id);
        Task<IEnumerable<Vet>> GetVetsByClinicId(Guid clinicId);
        Task<IEnumerable<Pet>> GetPetsByClinicId(Guid clinicId);
        Task<IEnumerable<Appointment>> GetAppointmentsByClinicId(Guid clinicId);
        Task<string> AddVetToClinic(Guid clinicId, ModelVet vet);
        Task<string> DeleteClinicById(Guid clinicId);
        Task<string> DeleteVetById(VetToDelete vet);
        Task<string> DeletePetById(PetToDelete pet);
        Task<string> AddPetsToClinic(Guid clinicId, List<Pet> pets);
        Task<string> UpdateClinic(Guid clinicId, ModelClinic clinic);
        Task<string> UpdatePetById(Guid clinicId, PetToUpdate pet);
        Task<string> UpdateVetById(Guid clinicId, VetToUpdate vet);
    }
}
