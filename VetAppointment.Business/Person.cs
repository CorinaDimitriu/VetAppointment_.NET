using VetAppointment.Business.Enums;

namespace VetAppointment.Business
{
    public abstract class Person
    {
        public string Name { get; protected set; }

        public string Surname { get; protected set; }

        public string Birthdate { get; protected set; }

        public PersonGender Gender { get; protected set; }
    }
}
