
namespace VetAppointment.Application.Response
{
    public class DrugResponse
    {
        public Guid Id { get; set; }
        public string? Name { get; set; }
        public double Quantity { get; set; }
        public double UnitPrice { get; set; }
    }
}
