﻿#nullable disable
namespace VetAppointment.Shared.Domain
{
    public class VetClinic
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public int NumberOfPlaces { get; set; }
        public string ContactEmail { get; set; }
        public string ContactPhone { get; set; }
    }
}
