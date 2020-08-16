using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TracNghiemService.IService;
using TracNghiemService.Model;
using TracNghiemService.Model.respone;

namespace TracNghiemService.Controllers
{
    [Route("api/account")]
    [ApiController]
    public class AccountController : ControllerBase
    {

        IAccountService _accountService;
        public AccountController(IAccountService accountService)
        {
            _accountService = accountService;
        }

        [HttpPost("Login")]
        public ActionResult<ResultRespone> Login([FromBody] Account account)
        {
            UserRespone result = _accountService.Login(account.username, account.password);

            if (result != null) 
                return Ok(result);
            return NoContent();
        }

        [HttpPost("createAccount")]
        public ActionResult<ResultRespone> createAccount([FromBody] User user)
        {
            bool result = _accountService.CreateAccount(user.username, user.fullName, user.email,user.phoneNumber, user.birthday, user.password, false);

            if (result == true)
                return Ok(new ResultRespone() { States = result });
            return NoContent();
        }
    }
}
