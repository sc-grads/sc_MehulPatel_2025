using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuizAppSect5
{
    internal class Question
    {
        public string QuestionText { get; set; }
        public string[] Answer { get; set; }
        public int CorrectAnswerIndex { get; set; }

        public Question(string questionText, string[] answer, int correctAnswer)
        {
            QuestionText = questionText;
            Answer = answer;
            CorrectAnswerIndex = correctAnswer;
        } 
        
        public bool IsCorrectAnswer(int choice)
        {
            return CorrectAnswerIndex == choice;
        }

        
    }
}
