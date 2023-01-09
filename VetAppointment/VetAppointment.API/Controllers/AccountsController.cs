using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using VetAppointment.API.Dtos;
using VetAppointment.API.Dtos.Create;
using VetAppointment.Application;
using VetAppointment.Domain;

namespace VetAppointment.API.Controllers
{
    [Route("v{version:apiVersion}/api/[controller]")]
    [ApiController]
    [ApiVersion("1")]
    public class AccountsController : ControllerBase
    {
        private readonly IUnitOfWork unitOfWork;
        public AccountsController(IUnitOfWork unitOfWork) => this.unitOfWork = unitOfWork;
# nullable disable
        private string CreateJWT(Account account)
        {
            var secretkey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(System.IO.File.ReadAllText("key")));
            
            var credentials = new SigningCredentials(secretkey, SecurityAlgorithms.HmacSha256);

            var claims = new[]
			{
                new Claim(ClaimTypes.Name, account.Username),
                new Claim(ClaimTypes.Role, account.Role.ToString())
            };

            var token = new JwtSecurityToken(issuer: "https://localhost:7029",
                audience: "https://localhost:7029", claims: claims,
                expires: DateTime.Now.AddMinutes(60), signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        [AllowAnonymous]
        [HttpPost]
        public IActionResult Login([FromBody] CreateAccountDto accountDto)
        {
            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");

            var user = Authenticate(accountDto);
            if (user != null)
            {
                System.IO.File.WriteAllText("Role", user.Role.ToString());
                var token = CreateJWT(user);
                return Ok(token);
            }

            return BadRequest("Incorrect credentials");
        }

        [ApiExplorerSettings(IgnoreApi = true)]
        private Account Authenticate(CreateAccountDto userLogin)
        {
            var user = unitOfWork.AccountRepository.All().Result.
                Where(x => x.Username == userLogin.Username).SingleOrDefault();

            if (user == null)
            {
                return null;
            }

            var password = user.Password;

            var passHAsher = new PasswordHasher<string>();
            if(passHAsher.VerifyHashedPassword("no need", password, userLogin.Password) == PasswordVerificationResult.Failed)
            {
                return null;
            }

            Account userAuth = Account.Create(user.Username, password, user.Role.ToString()).Entity;
            return userAuth;
        }

        [HttpPost("accountsCreate")]
        [Authorize(Roles = "Admin_Vet")]
        public IActionResult CreateAccount([FromBody] AccountDto accountDto)
        {
            var user = unitOfWork.AccountRepository.All().Result.
                Where(x => x.Username == accountDto.Username).SingleOrDefault();

            if (user != null)
            {
                return Conflict("User already exists");
            }

            var account = Account.Create(accountDto.Username, accountDto.Password, accountDto.Role, true);
            if(account.IsFailure)
            {
                return BadRequest(account.Error);
            }
            unitOfWork.AccountRepository.Add(account.Entity);

            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");
            return Created(nameof(CreateAccount), accountDto);
        }

        //private static string HashPassword(string password, out byte[] salt)
        //{
        //    salt = RandomNumberGenerator.GetBytes(64);
        //    var hash = Rfc2898DeriveBytes.Pbkdf2(Encoding.UTF8.GetBytes(password), salt,  350000, 
        //        HashAlgorithmName.SHA512, 64);
        //    return Convert.ToHexString(hash);
        //}

        [HttpPost("accountsLogout")]
        public IActionResult Logout(string noNeed) 
        {
            var secretkey = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(System.IO.File.ReadAllText("key")));

            var credentials = new SigningCredentials(secretkey, SecurityAlgorithms.HmacSha256);

            var claims = new[]
            {
                new Claim(ClaimTypes.Role, "nothing")
            };

            var token = new JwtSecurityToken(issuer: "https://localhost:7029",
                audience: "https://localhost:7029", claims,
                expires: DateTime.Now.AddMinutes(0), signingCredentials: credentials);

            return Ok(new JwtSecurityTokenHandler().WriteToken(token));
        }
    }
}
