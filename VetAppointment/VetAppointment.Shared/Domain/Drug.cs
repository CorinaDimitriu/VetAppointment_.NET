#nullable disable
namespace VetAppointment.Shared.Domain
{
    public class Drug
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public double Quantity { get; set; }
        public double UnitPrice { get; set; }
    }
}
