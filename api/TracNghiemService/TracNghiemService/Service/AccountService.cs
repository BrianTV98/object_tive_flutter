using Dapper;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using TracNghiemService.Common;
using TracNghiemService.IService;
using TracNghiemService.Model;
using TracNghiemService.Model.respone;

namespace TracNghiemService.Service
{
    public class AccountService : IAccountService
    {
        public bool ChangePaswword(string userName, string oldPassword, string newPassword)
        {
            try
            {
                using (IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<ResultRespone>("SP_CHANGPASSWORD", param: new { userName, oldPassword, newPassword }, commandType: CommandType.StoredProcedure);

                    return System.Convert.ToBoolean(check);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return false;
        }

        public bool CheckCode(string code)
        {
            return true;
        }

        public bool CreateAccount(string userName, string fullName, string email, string phoneNumber, string birthday, string password, bool isAdmin)
        {
            try
            {
                using (IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<ResultRespone>("SP_CREATE_ACCOUNT", param: new { userName, fullName, email, phoneNumber, birthday, password, isAdmin }, commandType: CommandType.StoredProcedure);


                    return check.First<ResultRespone>().States;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return false;
        }

        public UserRespone Login(string username, string password)
        {
            try
            {
                using (IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<UserRespone>("SP_LOGIN", param: new {username, password}, commandType: CommandType.StoredProcedure);

                    return check.First<UserRespone>();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return null;
        }

        public bool SendMailPassword(string email)
        {
            return true;
        }
    }
}
