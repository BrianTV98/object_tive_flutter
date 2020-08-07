using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TracNghiemService.IService;
using TracNghiemService.Model;
using TracNghiemService.Service;

namespace TracNghiemService.Controllers
{
    [Route("user")]
    [ApiController]
    public class UserController : ControllerBase
    {
        IUserSevice _userSevice;
      
        public UserController(IUserSevice userSevice)
        {
            _userSevice = userSevice;
        }

        [HttpGet("getUser/{idUser}")]
        public ActionResult<User> getUser(int idUser)
        {
            var data = _userSevice.Get(idUser);
            if (data != null)
            {
                return Ok(data);
            }
            return BadRequest();
        }

        [HttpGet("getAllUser")]
        public ActionResult<User> getAllUser()
        {
            var data = _userSevice.GetAll();
            if (data != null)
            {
                return Ok(data);
            }
            return BadRequest();
        }


    }
}
