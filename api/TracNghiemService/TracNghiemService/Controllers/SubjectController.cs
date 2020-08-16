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
    [Route("api/subject")]
    [ApiController]
    public class SubjectController : ControllerBase
    {
        ISubjectService _subjectService;
        public SubjectController(ISubjectService  subjectService)
        {
            _subjectService = subjectService;
        }

        [HttpGet("ListSubject")]
        public ActionResult<List<Subject> >getListSubject()
        {
          
            List < Subject > result = _subjectService.getListSubject();

            if (result != null)
                return Ok(result);
            return null;
        }

        [HttpGet("ListTheme/{idSubject}")]
        public ActionResult<List<Theme>> getListThemes(string idSubject)
        {
            try
            {
                List<Theme> result = _subjectService.getListThemeFollowSubject(int.Parse(idSubject));

                if (result != null)
                    return Ok(result);
                return null;
            }
            catch (Exception e)
            {
                return null;
            }
           
        }
    }
}
