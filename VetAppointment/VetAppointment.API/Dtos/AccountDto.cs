using VetAppointment.API.Dtos.Create;

namespace VetAppointment.API.Dtos
{
# nullable disable
    public class AccountDto : CreateAccountDto
    {
        public string Role { get; set; }
    }
}
