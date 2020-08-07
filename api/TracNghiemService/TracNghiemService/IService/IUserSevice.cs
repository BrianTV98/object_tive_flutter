using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TracNghiemService.Model;

namespace TracNghiemService.IService
{
    public interface IUserSevice
    {
        bool Create(User user);

        bool Update(User user);

        List<User> GetAll();

        User Get(int idUser);

        bool Delete(int idSudent);

    }
}
