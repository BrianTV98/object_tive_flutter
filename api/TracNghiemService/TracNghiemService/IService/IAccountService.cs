using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TracNghiemService.Model.respone;

namespace TracNghiemService.IService
{
    public interface IAccountService
    {
        UserRespone Login(String username, String password);

        bool SendMailPassword(String email);

        bool CheckCode(String code);

        bool ChangePaswword(String userName, String oldPassword, String newPassword);

        bool CreateAccount(String userName, String fullName, String email, String phoneNumber, String birthday, String password, bool isAdmin);

    }
}
