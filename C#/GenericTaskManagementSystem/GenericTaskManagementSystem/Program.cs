using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericTaskManagementSystem
{
    internal interface ITask<TResult>
    {
        TResult Perform();
    }

    class EmailTask : ITask<string>
    {
        public string Recipient { get; set; }
        public string Message { get; set; }
        public string Perform()
        {
            return $"Email sent to {Recipient} with message: {Message}";
        }
    }

    class ReportTask : ITask<string>
    {
        public string ReportName { get; set; }
        public string Perform()
        {
            return $"Report {ReportName} generated.";
        }
    }

    class TaskProcessor<TTask, TResult> where TTask : ITask<TResult>
    {
        private TTask task;
        public TaskProcessor(TTask taskParam)
        {
            task = taskParam;
        }
        public TResult Execute()
        {
            return task.Perform();
        }
    }



    internal class Program
    {
        static void Main(string[] args)
        {

            var emailTask = new EmailTask { Recipient = "example@example.com", Message = "Hello, this is a test email" };
            var reportTask = new ReportTask { ReportName = "Annual Report" };
            var emailProcessor = new TaskProcessor<EmailTask, string>(emailTask);
            var reportProcessor = new TaskProcessor<ReportTask, string>(reportTask);

            Console.WriteLine(emailProcessor.Execute());
            Console.WriteLine(reportProcessor.Execute());

            Console.ReadLine();
        }
    }
}