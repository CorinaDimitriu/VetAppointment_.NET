#nullable disable
using VetAppointment.API.Dtos.Create;

namespace VetAppointment.API.Dtos
{
    public class DrugDto : CreateDrugDto
    {
        public DrugDto(string v1, int v2, double v3)
        {
            V1 = v1;
            V2 = v2;
            V3 = v3;
        }

        public Guid Id { get; set; }
        public string V1 { get; }
        public int V2 { get; }
        public double V3 { get; }
    }
}
