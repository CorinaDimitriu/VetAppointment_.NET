using VetAppointment.Business;

namespace VetAppointment.API.Features.Vets
{
    public class VetDto
    {
        public string Name { get; set; }

        public string Surname { get; set; }

        public string Birthdate { get; set; }

        public string Gender { get; set; }

        public string Email { get; set; }

        public string Phone { get; set; }
    }
}
