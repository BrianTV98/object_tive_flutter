using Dapper;
using System;
using System.Data;
using System.Data.SqlClient;
using TracNghiemService.Common;
using TracNghiemService.IService;
using TracNghiemService.Model;

namespace TracNghiemService.Service
{
    public class AccountService : IAccountService
    {
        public bool ChangePaswword(string userName, string oldPassword, string newPassword)
        {
            throw new NotImplementedException();
        }

        public bool CheckCode(string code)
        {
            throw new NotImplementedException();
        }

        public bool Login(string username, string password)
        {
            try
            {
                using (IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<User>("SP_LOGIN", param: new {username, password}, commandType: CommandType.StoredProcedure);

                    return System.Convert.ToBoolean(check);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return false;
        }

        public bool SendMailPassword(string email)
        {
            throw new NotImplementedException();
        }
    }
}
