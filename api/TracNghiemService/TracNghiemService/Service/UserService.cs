using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Threading.Tasks;
using TracNghiemService.Common;
using TracNghiemService.IService;
using TracNghiemService.Model;

namespace TracNghiemService.Service
{
    public class UserService : IUserSevice
    {
        User _oUser = new User();
        List<User> _oUsers =  new List<User>();

        public bool Create(User user)
        {
           
            try
            {
                using (IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<User>("SP_CreateUser", param: user, commandType: CommandType.StoredProcedure);

                    return System.Convert.ToBoolean(check);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return false;

        }

        public User Get(int id)
        {
            _oUser = new User();
            try
            {
                using (IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var oUsers = con.Query<User>("SP_GET_USER_INFOR", param: new { idUser=id}, commandType: CommandType.StoredProcedure);

                    if (oUsers != null && oUsers.Count() > 0)
                    {
                        _oUser = oUsers.FirstOrDefault();
                        return _oUser;
                    }
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return null;
        }

        public List<User> GetAll()
        {
            try
            {
                using (IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<User>("SP_GET_ALL_USER", commandType: CommandType.StoredProcedure);

                    return (List<User>)check;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return null;
        }

        public bool Update(User user)
        {
            try
            {
                using (IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<User>("SP_UpDateUser", param: user, commandType: CommandType.StoredProcedure);

                    return System.Convert.ToBoolean(check);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return false;
        }

        bool IUserSevice.Delete(int idSudent)
        {
            try
            {
                using (IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<User>("SP_DeleteUser", param: idSudent, commandType: CommandType.StoredProcedure);

                    return System.Convert.ToBoolean(check);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return false;
        }
    }
}
