using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using VetAppointment.API.Dtos;
using VetAppointment.Domain;

namespace VetAppointment.API.Controllers
{
    [Route("v{version:apiVersion}/api/[controller]")]
    [ApiController]
    [ApiVersion("1")]
    public class AccountsController : ControllerBase
    {
# nullable disable
        private string CreateJWT(AccountDto accountDto)
        {
            var secretkey = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(System.IO.File.ReadAllText("key")));

            var credentials = new SigningCredentials(secretkey, SecurityAlgorithms.HmacSha256);

            var claims = new[]
			{
                new Claim(ClaimTypes.Name, accountDto.Username),
				//new Claim(JwtRegisteredClaimNames.Sub, accountDto.Username),
                //new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString("N")),
                new Claim(ClaimTypes.Role, accountDto.Username)
            };

            var token = new JwtSecurityToken(issuer: "https://localhost:7029",
                audience: "https://localhost:7029", claims: claims,
                expires: DateTime.Now.AddMinutes(1), signingCredentials: credentials);
            //var userIdentity = new ClaimsIdentity(claims, "User Identity");
            //var userPrincipal = new ClaimsPrincipal(new[] { userIdentity });
            //HttpContext.SignInAsync(userPrincipal);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        [AllowAnonymous]
        [HttpPost]
        public IActionResult Login([FromBody] AccountDto accountDto)
        {
            Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, x-requested-with");
            Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
            Response.Headers.Add("Access-Control-Allow-Origin", "https://localhost:7029");

            var user = Authenticate(accountDto);
            if (user != null)
            {
                var token = CreateJWT(accountDto);
                return Ok(token);
            }

            return NotFound("user not found");
        }

        [ApiExplorerSettings(IgnoreApi = true)]
        private AccountDto Authenticate(AccountDto userLogin)
        {
            //var currentUser = UserConstants.Users.FirstOrDefault(x => x.Username.ToLower() ==
            //    userLogin.Username.ToLower() && x.Password == userLogin.Password);
            //if (currentUser != null)
            //{
            //    return currentUser;
            //}
            //return null;
            return userLogin;
        }

        [ApiExplorerSettings(IgnoreApi = true)]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync();
            return Redirect("/");
        }
    }
}
