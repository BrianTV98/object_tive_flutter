using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TracNghiemService.Model;

namespace TracNghiemService.IService
{
    public interface IQuestionService
    {
        public List<Question> getListQuestionFollowIdThemes(String idThemes);

        public List<Question> getListQuestionFollowIdSubject(String idSubject);

        public bool deleteQuestion(String idQuestion);

        public Question getQuestion(String idQuestion);

        public Question updateQuestion(Question question);

        public List<Question> insertQuestion(List<Question> questions);

        public List<DetailExam> getExam(int idSubject, String idUser);

        public List<Exam> updateExam(List<Exam> exams);
        public List<ReviewExam> reviewExam(int idSubject, string userName);

        public List<LearningProcess> learningProcess(int idSubject, string userName);
    }
}
