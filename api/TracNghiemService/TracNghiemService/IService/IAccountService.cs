using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TracNghiemService.IService
{
    interface IAccount
    {
        bool Login(String username, String password);

        bool SendMailPassword(String email);

        bool CheckCode(String code);

        bool ChangePaswword(String userName, String oldPassword, String newPassword);

    }
}
