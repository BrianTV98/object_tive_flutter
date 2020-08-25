﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TracNghiemService.IService;
using TracNghiemService.Model;

namespace TracNghiemService.Controllers
{
    [Route("api/question")]
    [ApiController]
    public class QuestionController : ControllerBase
    {

        IQuestionService _questionService;
        public QuestionController(IQuestionService questionService)
        {
            _questionService = questionService;
        }

        [HttpGet("getQuestionFollowIdThemes/{idTheme}")]
        public ActionResult<List<Question>> getListQuestion(string idTheme)
        {
            var data = _questionService.getListQuestionFollowIdThemes(idTheme);
            if (data != null)
            {
                return Ok(data);
            }
            return NoContent();
        }

        [HttpGet("getQuestionFollowIdSubject/{idSubject}")]
        public ActionResult<List<Question>> getListQuestionFollowSubject(string idSubject)
        {
            var data = _questionService.getListQuestionFollowIdSubject(idSubject);
            if (data != null)
            {
                return Ok(data);
            }
            return NoContent();
        }

        [HttpGet("deleteQuestion/{idQuestion}")]
        public ActionResult<List<Question>> deleteQuestion(string idQuestion)
        {
            var data = _questionService.deleteQuestion(idQuestion);
            if (data ==true)
            {
                return Ok(data);
            }
            return NoContent();
        }

        [HttpGet("getQuestion/{idQuestion}")]
        public ActionResult<Question> getQuestion(String idQuestion)
        {
            var data = _questionService.getQuestion(idQuestion);
            if (data != null)
            {
                return Ok(data);
            }
            return NoContent();
        }

        [HttpPost("updateQuestion")]
        public ActionResult<List<Question>> updateQuestion([FromBody] Question question)
        {
            question.lastUpdate = DateTime.Today;
            var data = _questionService.updateQuestion(question);
            if (data != null)
            {
                return Ok(data);
            }
            return NoContent();
        }


        [HttpPost("createQuestion")]
        public ActionResult<List<Question>> createQuestion([FromBody] List<Question> questions)
        {
            
            foreach(var item in questions)
            {
                item.lastUpdate = DateTime.Now;
            }
            var data = _questionService.insertQuestion(questions);
            //if (data != null)
            //{
                return Ok(data);
            //}
            //return NoContent();
        }



        //exam
        [HttpGet("getExam/{idSubject}/{username}")]
        public ActionResult<List<Question>> createQuestion(int idSubject, String username)
        {

            var data = _questionService.getExam(idSubject, username);
            if (data != null)
            {
                return Ok(data);
            }
            return NoContent();
        }

        [HttpPost("upDateExample")]
        public ActionResult<List<Question>> updateExam([FromBody] List<Exam> Exams)
        {

            var data = _questionService.updateExam(Exams);
            //if (data != null)
            //{
            return Ok(data);
            //}
            //return NoContent();
        }

        [HttpGet("reviewExam/{idSubject}/{userName}")]
        public ActionResult<List<Question>> reviewExam(int idSubject, string userName)
        {

            var data = _questionService.reviewExam(idSubject, userName);
            if (data != null)
            {
                return Ok(data);
            }
            return NoContent();
        }

    }
}
