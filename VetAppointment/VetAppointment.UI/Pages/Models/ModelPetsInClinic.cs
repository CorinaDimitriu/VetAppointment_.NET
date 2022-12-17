using System.ComponentModel.DataAnnotations;

#nullable disable
namespace VetAppointment.UI.Pages.Models
{
    public class ModelPetsInClinic
    {
        [ValidateComplexType]
        public List<ModelPet> Pets { get; set; } = default!;
        public string ClinicId { get; set; } = default!;
        public int Count { get; set; } = default!;
    }
}
