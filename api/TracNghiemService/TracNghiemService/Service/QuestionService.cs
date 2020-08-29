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

        public List<DetailExam> getExam(int idSubject,String idUser)
        {
            try
            {
                using (System.Data.IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<DetailExam>("SP_CREATE_EXAM", param: new { idSubject,idUser }, commandType: CommandType.StoredProcedure);
                    int countList = check.ToList().Count;
                    if (countList == 30)
                    {
                        return check.ToList();
                    }
                    return null;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return null;
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

        class ResultIdExam
        {
            public int IdExam { get; set; }
        }

        public List<Exam> updateExam(List<Exam> exams)
        {
            try
            {
                using (System.Data.IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

      
                    List<Exam> errExams = new List<Exam>();
                    foreach (var item in exams)
                    {
                       
                        try
                        {    var check = con.Query<ResultRespone>("SP_UPDATE_EXAM", param: new {item.idExam,item.idQuestion, item.chooseAnswer }, commandType: CommandType.StoredProcedure);
                            if (check.First<ResultRespone>().States == false) 
                                errExams.Add(item);
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine(e.Message);
                        }

                    }

                    return errExams;
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

        public List<ReviewExam> reviewExam(int idSubject, string userName)
        {
            try
            {
                using (System.Data.IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<ReviewExam>("GET_LAST_EXAM", param: new { idSubject , userName }, commandType: CommandType.StoredProcedure);

                    return check.ToList();

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return null;
        }

        public List<LearningProcess> learningProcess(int idSubject, int idTheme, string userName)
        {
            try
            {
                using (System.Data.IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<LearningProcess>("SP_GET_QUESTION_LEARNING", param: new { idSubject,idTheme,userName }, commandType: CommandType.StoredProcedure);

                    return check.ToList();

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return null;
        }

        public ResultRespone upDatelearningProcess(int idSubject, int idQuestion, string userName, string chooseAnswer)
        {
            try
            {
                using (System.Data.IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<ResultRespone>("SP_UPDATE_LEARNINGPROCESS", param: new { idSubject, idQuestion, userName, chooseAnswer }, commandType: CommandType.StoredProcedure);

                    return check.First<ResultRespone>();

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return null;
        }

        public List<Theme> getPercentTheme(int idSubject, string username)
        {
            try
            {
                using (System.Data.IDbConnection con = new SqlConnection(Global.ConnectionString))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                    var check = con.Query<Theme>("GET_LEARNING_PERCENT_FOLLOW_THEMES", param: new { idSubject, username }, commandType: CommandType.StoredProcedure);

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
