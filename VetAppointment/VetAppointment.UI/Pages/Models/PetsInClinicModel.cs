using System.ComponentModel.DataAnnotations;

#nullable disable
namespace VetAppointment.UI.Pages.Models
{
    public class PetsInClinicModel
    {
        [ValidateComplexType]
        public List<PetModel> Pets { get; set; } = default!;
        public int Count { get; set; } = default!;
    }
}
