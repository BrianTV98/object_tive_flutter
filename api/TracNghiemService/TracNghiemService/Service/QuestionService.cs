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
    public class QuestionService : IQuestionService
    {
        public bool deleteQuestion(string idQuestion)
        {
            try
            {
                using (System.Data.IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<ResultRespone>("SP_DeleteQuestion", param: new { idQuestion }, commandType: CommandType.StoredProcedure);

                    return check.First<ResultRespone>().States;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return false;
        }

        public List<Question> getListQuestionFollowIdSubject(string idSubject)
        {
            try
            {
                using (System.Data.IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<Question>("SP_GET_LIST_QUESTION_FOLLOW_SUBJECT", param: new { idSubject }, commandType: CommandType.StoredProcedure);

                    return check.ToList();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return null;
        }

        public List<Question> getListQuestionFollowIdThemes(string idThemes)
        {
            try
            {
                using (System.Data.IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<Question>("SP_GET_LIST_QUESTION_FOLLOW_THEME", param: new { idThemes }, commandType: CommandType.StoredProcedure);

                    return check.ToList();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return null;
        }

        public Question getQuestion(string idQuestion)
        {
            try
            {
                using (System.Data.IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<Question>("SP_GET_QUESTION", param: new { idQuestion }, commandType: CommandType.StoredProcedure);

                    return check.First<Question>();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return null;
        }

        public List<Question> insertQuestion(List<Question> questions)
        {
            try
            {
                using (System.Data.IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    List<Question> quesstionError = new List<Question>();
                    foreach(var item in questions)
                    {
                        var check = con.Query<ResultRespone>("SP_INSERT_QUESTION", param: item, commandType: CommandType.StoredProcedure);
                        try
                        {
                            if (check.First<ResultRespone>().States == false) quesstionError.Add(item);
                        }
                        catch(Exception e)
                        {
                            Console.WriteLine(e.Message);
                        }
                        
                    }
                   
                    return quesstionError;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return null;
        }

        public Question updateQuestion(Question question)
        {
            try
            {
                using (System.Data.IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<Question>("SP_EditQuestion", param: question, commandType: CommandType.StoredProcedure);

                    return check.First<Question>();
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
