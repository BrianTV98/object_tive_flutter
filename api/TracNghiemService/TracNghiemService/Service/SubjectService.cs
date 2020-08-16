using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using TracNghiemService.Common;
using TracNghiemService.IService;
using TracNghiemService.Model;

namespace TracNghiemService.Service
{
    public class SubjectService : ISubjectService
    {
        public List<Subject> getListSubject()
        {
            try
            {
                using (System.Data.IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<Subject>("SP_GET_LIST_MON_HOC", commandType: CommandType.StoredProcedure);

                    return check.ToList();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return null;
        }

        public List<Theme> getListThemeFollowSubject(int idSubject)
        {
            try
            {
                using (System.Data.IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<Theme>("[GET_LIST_THEME]", param: new { idSubject}, commandType: CommandType.StoredProcedure);

                    return check.ToList();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return null;
        }
    }
}
