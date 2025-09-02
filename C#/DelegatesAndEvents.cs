//using System.Security.Cryptography.X509Certificates;

//namespace DelegatesAndEvents
//{

//    internal class Program
//    {

//        // 1. Declaration:
//        public delegate void Notify(string message);


//        static void Main(string[] args)
//        {
//            // Delegates define a method signature,
//            // and any method assigned to a delegate must match this signature.



//            // 2. Instantiation:
//            Notify notifyDelegate = ShowMessage;
//            //Notify notifyDelegate = new Notify(notifyDelegate);


//            // 3. Invocation:
//            notifyDelegate("Hello, Delegates!");


//            Console.ReadKey();
//        }

//        static void ShowMessage(string messag2e)
//        {
//            Console.WriteLine(messag2e);
//        }
//    }
//} 




//simple delegate examples
//namespace DelegatesAndEvents
//{

//    public delegate void LogHandler(string message);

//    public class Logger
//    {
//        public void LogToConsole(string message)
//        {
//            Console.WriteLine("Console Log: " + message);
//        }

//        public void LogToFile(string message)
//        {
//            Console.WriteLine("File log: " + message);
//        }
//    }


//    internal class Program
//    {


//        static void Main(string[] args)
//        {
//            Logger logger = new Logger();
//            LogHandler logHandler = logger.LogToConsole;
//            logHandler("Logging to console");

//            logHandler = logger.LogToFile;
//            logHandler("Log some stuff");

//            Console.ReadKey();
//        }



//    }
//}




////Generics
//using System.Security.Cryptography.X509Certificates;

//namespace DelegatesAndEvents
//{


//    internal class Program
//    {




//        static void Main(string[] args)
//        {
//            int[] intArray = { 1, 2, 3, 4, 5, };
//            string[] stringArray = { "One", "Two", "Three", "Four" };

//            PrintArray(intArray);
//            PrintArray(stringArray);
//            Console.ReadKey();
//        }

//        public static void PrintIntArray(int[] array)
//        {
//            foreach (int item in array)
//            {
//                Console.WriteLine(item);
//            }
//        }

//        public static void PrintStringArray(string[] array)
//        {
//            foreach (string item in array)
//            {
//                Console.WriteLine(item);
//            }
//        }

//        // a generic Method, that accepts a generic datatype
//        public static void PrintArray<T>(T[] array)
//        {
//            foreach (T item in array)
//            {
//                Console.WriteLine(item);
//            }

//        }

//    }
//}





////Combining generics with delegates
//using System.Reflection.Metadata;

//namespace DelegatesAndEvents
//{

//    public delegate int Comparison<T>(T x, T y);

//    public class Person
//    {
//        public int Age { get; set; }
//        public string Name { get; set; }
//    }


//    public class PersonSorter
//    {
//        public void Sort(Person[] people, Comparison<Person> comparison)
//        {
//            for (int i = 0; i < people.Length - 1; i++)
//            {
//                for (int j = i + 1; j < people.Length; j++)
//                {
//                    // Compare people[i] and people[j] using the provided comparison delegate
//                    if (comparison(people[i], people[j]) > 0)
//                    {
//                        // Swap people[i] and people[j] if they are in the wrong order
//                        Person temp = people[i];
//                        people[i] = people[j];
//                        people[j] = temp;

//                        // people[0] Alice
//                        // people[1] Bob
//                        // people[2] Charlie

//                    }
//                }
//            }
//        }
//    }


//    internal class Program
//    {


//        static void Main(string[] args)
//        {
//            Person[] people = {
//            new Person { Name = "Alice", Age = 30 },
//            new Person { Name = "Bob", Age = 25 },
//            new Person { Name = "Denis", Age= 36},
//            new Person { Name = "Charlie", Age = 35 }
//            };

//            PersonSorter sorter = new PersonSorter();
//            sorter.Sort(people, CompareByAge);

//            foreach (Person person in people)
//            {
//                Console.WriteLine($"{person.Name}, {person.Age}");
//            }

//            sorter.Sort(people, CompareByName);

//            foreach (Person person in people)
//            {
//                Console.WriteLine($"{person.Name}, {person.Age}");
//            }

//            Console.ReadKey();
//        }

//        static int CompareByAge(Person x, Person y)
//        {
//            return x.Age.CompareTo(y.Age);
//        }

//        static int CompareByName(Person x, Person y)
//        {
//            return x.Name.CompareTo(y.Name);
//        }

//    }
//}



//multicast delegates
//namespace DelegatesAndEvents
//{

//    public delegate void LogHandler(string message);

//    public class Logger
//    {
//        public void LogToConsole(string message)
//        {
//            Console.WriteLine("Console Log: " + message);
//        }

//        public void LogToFile(string message)
//        {
//            Console.WriteLine("File log: " + message);
//        }
//    }


//    internal class Program
//    {


//        static void Main(string[] args)
//        {
//            Logger logger = new Logger();

//            // Creating a multicast delegate
//            LogHandler logHandler = logger.LogToConsole;
//            logHandler += logger.LogToFile;

//            // invoking the multicast delegate
//            logHandler("Log this info!");

//            // Removing a method from the multicast delegate
//            logHandler -= logger.LogToFile;

//            logHandler("After removing LogToFile");

//            Console.ReadKey();
//        }



//    }
//} 


using System.Diagnostics.Metrics;

namespace DelegatesAndEvents
{

    public delegate void LogHandler(string message);

    public class Logger
    {
        public void LogToConsole(string message)
        {
            Console.WriteLine("Console Log: " + message);
        }

        public void LogToFile(string message)
        {
            Console.WriteLine("File log: " + message);
        }
    }


    internal class Program
    {


        static void Main(string[] args)
        {
            Logger logger = new Logger();

            // Creating a multicast delegate
            LogHandler logHandler = logger.LogToConsole;
            logHandler += logger.LogToFile;

            // invoking the multicast delegate
            logHandler("Log this info!");

            foreach (LogHandler handler in logHandler.GetInvocationList())
            {
                try
                {
                    handler("Event occured with error handling");
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Exception caught: " + ex.Message);
                }
            }





            // Removing a method from the multicast delegate

            if (IsMethodInDelegate(logHandler, logger.LogToFile))
            {
                logHandler -= logger.LogToFile;
                Console.WriteLine("LogToFile method removed");
            }
            else
            {
                Console.WriteLine("LogToFile Method not found!");
            }


            if (logHandler != null)
            {
                InvokeSafely(logHandler, "After removing LogToFile");

            }

            //logHandler("After removing LogToFile");

            Console.ReadKey();
        }

        static void InvokeSafely(LogHandler logHandler, string message)
        {
            LogHandler tempLogHandler = logHandler;
            if (tempLogHandler != null)
            {
                tempLogHandler(message);
            }
        }

        static bool IsMethodInDelegate(LogHandler logHandler, LogHandler method)
        {
            if (logHandler == null)
            {
                return false;
            }

            foreach (var d in logHandler.GetInvocationList())
            {
                if (d == (Delegate)method)
                {
                    return true;
                }
            }

            return false;

        }

    }
}
