﻿#nullable disable
namespace VetAppointment.Application.Response
{
    public class VetResponse
    {
        public Guid Id { get; set; }
        public Guid ClinicId { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Birthdate { get; set; }
        public string Gender { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Specialisation { get; set; }
    }
}
