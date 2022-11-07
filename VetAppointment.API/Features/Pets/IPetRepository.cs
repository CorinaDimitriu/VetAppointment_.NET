using VetAppointment.Business;

namespace VetAppointment.API.Features.Pets
{
    public interface IPetRepository
    {
        void Add(Pet pet);
        IEnumerable<Pet> GetAll();
    }
}