using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TracNghiemService.Model;

namespace TracNghiemService.IService
{
    public interface ISubjectService
    {
        public List<Subject> getListSubject();
        public List<Theme> getListThemeFollowSubject(int idSubject);

    }
}
