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

    }
}
