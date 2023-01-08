using System.ComponentModel.DataAnnotations;
using VetAppointment.Shared.Domain;

namespace VetAppointment.UI.Pages.Models
{
    public class PrescribedDrugsInTreatmentModel
    {
        [ValidateComplexType]
        public List<PrescribedDrugModel> PrescribedDrugs { get; set; } = default!;
        public int Count { get; set; } = default!;
    }
}
