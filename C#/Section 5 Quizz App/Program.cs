namespace QuizAppSect5
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Question[] questions = new Question[]
            {
                new Question("What is the capital of Germany?", new string[] { "Paris", "Berlin", "London", "Mardid"}, 1),
                new Question("What is 1 + 1?", new string[] {"2", "4", "5", "6"}, 0)
            };

            Quiz myQuiz = new Quiz(questions);
            myQuiz.StartQuiz();
            Console.ReadLine();
        }
    }
}
