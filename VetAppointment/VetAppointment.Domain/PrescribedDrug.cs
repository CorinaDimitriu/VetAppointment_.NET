using VetAppointment.Domain.Helpers;

namespace VetAppointment.Domain
{
   #nullable disable
    public class PrescribedDrug
    {
        public Guid Id { get; private set; }
        public float Quantity { get; private set; }
        public Guid DrugToPrescribeId { get; private set; }
        public float TotalCost { get; private set; }
        public Guid DrugId { get; private set; }

        public static Result<PrescribedDrug> Create(float quantity, Drug drugToPrescribe)
        {
            if (quantity < 0)
            {
                return Result<PrescribedDrug>.Failure($"Quantity {quantity} of prescribed drug is not valid");
            }

            if (quantity > drugToPrescribe.Quantity)
            {
                return Result<PrescribedDrug>.Failure($"Quantity {quantity} of prescribed drug exceeds existing stock");
            }

            var prescribedDrug = new PrescribedDrug
            {
                Quantity = quantity,
                DrugToPrescribeId = drugToPrescribe.Id,
                TotalCost = CalculateDrugCost(quantity, drugToPrescribe.UnitPrice)
            };

            return Result<PrescribedDrug>.Success(prescribedDrug);
        }
        
        // float -> double
        private static float CalculateDrugCost(float quantity, float price)
        {
            return quantity * price;
        }
    }
}
