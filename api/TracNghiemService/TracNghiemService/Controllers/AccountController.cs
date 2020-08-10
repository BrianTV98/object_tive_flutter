using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TracNghiemService.IService;
using TracNghiemService.Model;

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
            bool result = _accountService.Login(account.username, account.password);

            if (result == true) 
                return Ok(new ResultRespone() { States = result });
            return NoContent();
        }
    }
}
