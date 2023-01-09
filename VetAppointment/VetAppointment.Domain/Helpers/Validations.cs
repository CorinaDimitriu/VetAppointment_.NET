using System.Text.RegularExpressions;
using VetAppointment.Domain.Enums;

namespace VetAppointment.Domain.Helpers
{
    public static partial class Validations
    {
        public static List<VetSpecialisation> BasicResources { get; private set; } = 
            new() { VetSpecialisation.PawSurgeon, VetSpecialisation.Nutritionist, VetSpecialisation.DentalCaretaker};
        public static bool IsValidEmail(string email)
        {
            if (email == null)
            {
                return false;
            }
            
            email = email.Trim();

            if (email.Length == 0)
            {
                return false;
            }

            if (email.EndsWith("."))
            {
                return false;
            }

            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        public static bool IsValidPhoneNumber(string phoneNumber)
        {
            if (phoneNumber == null)
            {
                return false;
            }

            phoneNumber = phoneNumber.Trim();

            if (phoneNumber.StartsWith("+"))
            {
                phoneNumber = phoneNumber[1..];
                return phoneNumber.Length == 11 && phoneNumber.All(char.IsDigit) && phoneNumber.StartsWith("40");
            }

            return false;
        }

        public static bool IsValidPassword(string password)
        {
            if (password.Length < 8)
            {
                return false;
            }

            bool flag = false;
            for (char smallCh = 'a'; smallCh <= 'z';smallCh++)
            {
                if (password.Contains(smallCh) )
                {
                    flag = true;
                    break;
                }
            }

            if(!flag)
            {
                return false;
            }

            flag = false;
            for (char smallCh = 'A'; smallCh <= 'Z'; smallCh++)
            {
                if (password.Contains(smallCh))
                {
                    flag = true;
                    break;
                }
            }

            if (!flag)
            {
                return false;
            }

            flag = false;
            for (char smallCh = '0'; smallCh <= '9'; smallCh++)
            {
                if (password.Contains(smallCh))
                {
                    flag = true;
                    break;
                }
            }

            return flag;
        }
    }
}