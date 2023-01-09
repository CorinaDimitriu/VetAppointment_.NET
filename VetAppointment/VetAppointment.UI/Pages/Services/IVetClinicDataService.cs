using VetAppointment.Shared.Domain;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Services
{
    public interface IVetClinicDataService
    {
        Task<IEnumerable<VetClinic>> GetAllClinics();
        Task<string> AddClinic(VetClinic clinic, string jwt);
        Task<VetClinic> GetClinicById(Guid id);
        Task<IEnumerable<Vet>> GetVetsByClinicId(Guid clinicId);
        Task<IEnumerable<Pet>> GetPetsByClinicId(Guid clinicId);
        Task<IEnumerable<Appointment>> GetAppointmentsByClinicId(Guid clinicId);
        Task<string> AddVetToClinic(Guid clinicId, VetModel vet, string jwt);
        Task<string> DeleteClinicById(Guid clinicId, string jwt);
        Task<string> DeleteVetById(VetToDeleteModel vet, string jwt);
        Task<string> DeletePetById(PetToDeleteModel pet);
        Task<string> AddPetsToClinic(Guid clinicId, Guid ownerId, List<Pet> pets);
        Task<string> UpdateClinic(Guid clinicId, ClinicModel clinic, string jwt);
        Task<string> UpdatePetById(Guid clinicId, Guid petId, PetToUpdateModel pet);
        Task<string> UpdateVetById(Guid clinicId, Guid vetId, VetModel vet, string jwt);
        Task<string> AddAppointmentToClinic(Guid clinicId, AppointmentModel appointment);
    }
}
