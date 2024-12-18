﻿using VetAppointment.Domain.Helpers;

namespace VetAppointment.Domain
{
   #nullable disable
    public class PrescribedDrug
    {
        public Guid Id { get; private set; }
        public double Quantity { get; private set; }
        public Guid DrugToPrescribeId { get; private set; }
        public double TotalCost { get; private set; }
        public Guid TreatmentId { get; private set; }

        public static Result<PrescribedDrug> Create(double quantity, Drug drugToPrescribe)
        {
            if (quantity < 0)
            {
                return Result<PrescribedDrug>.Failure($"Quantity {quantity} of prescribed drug is not valid");
            }

            if (quantity > drugToPrescribe.Quantity)
            {
                return Result<PrescribedDrug>.Failure($"Quantity {quantity} of prescribed drug exceeds existing stock");
            }

            drugToPrescribe.Quantity -= quantity;

            var prescribedDrug = new PrescribedDrug
            {
                Id = Guid.NewGuid(),
                Quantity = quantity,
                DrugToPrescribeId = drugToPrescribe.Id,
                TotalCost = CalculateDrugCost(quantity, drugToPrescribe.UnitPrice)
            };

            return Result<PrescribedDrug>.Success(prescribedDrug);
        }
        private static double CalculateDrugCost(double quantity, double price)
        {
            return quantity * price;
        }

        public void CalculatePresribedDrugCost(Drug drug)
        {
            TotalCost = CalculateDrugCost(Quantity, drug.UnitPrice);
        }

        public void UpdateDrugToPrescribeId(Guid drugToPrescribeId) => DrugToPrescribeId = drugToPrescribeId;

        public void UpdateQuantity(double quantity) => Quantity = quantity;

        public Result Update(double quantity, Drug drugToPrescribe)
        {
            if (quantity < 0)
            {
                return Result.Failure($"Quantity {quantity} of prescribed drug is not valid");
            }

            if (quantity > drugToPrescribe.Quantity)
            {
                return Result.Failure($"Quantity {quantity} of prescribed drug exceeds existing stock");
            }

            Quantity = quantity;
            TotalCost = CalculateDrugCost(quantity, drugToPrescribe.UnitPrice);

            return Result.Success();
        }

        public void AttachToTreatment(Treatment treatment)
        {
            TreatmentId = treatment.Id;
        }
    }
}
