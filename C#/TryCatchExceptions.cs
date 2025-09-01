//namespace TryCatch
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            int result = 0;

//            try
//            {
//                Console.WriteLine("Please enter a number");
//                int num1 = int.Parse(Console.ReadLine());
//                //int num1 = 0;
//                int num2 = 2;
//                result = num2 / num1;
//            }
//            catch (Exception ex)
//            {
//                Console.WriteLine("Error: " + ex.Message);
//            }

//            Console.WriteLine("Result: " + result);
//            Console.ReadKey();



//        }
//    }
//}




//the finally keyword

//namespace TryCatch
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            int result = 0;

//            try
//            {
//                Console.WriteLine("Please enter a number");
//                int num1 = int.Parse(Console.ReadLine());
//                //int num1 = 0;
//                int num2 = 2;
//                result = num2 / num1;
//            }
//            catch (Exception ex)
//            {
//                Console.WriteLine("Error: " + ex.Message);
//            }
//            finally
//            {
//                // Code to cleanup or finalize
//                // ideal for cleaning up resources,
//                // like closing file streams or database connections.

//                Console.WriteLine("This always executes");
//            }

//            Console.WriteLine("Result: " + result);
//            Console.ReadKey();



//        }
//    }
//}




//debug log
//using System.Diagnostics;

//namespace TryCatch
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            int result = 0;

//            Debug.WriteLine("Main method is running");

//            try
//            {
//                Console.WriteLine("Please enter a number");
//                int num1 = int.Parse(Console.ReadLine());
//                //int num1 = 0;
//                int num2 = 2;
//                result = num2 / num1;
//            }
//            catch (Exception ex)
//            {
//                Console.WriteLine("Error: " + ex.Message);
//                // This next line is only executed during "Debugging"
//                Debug.WriteLine(ex.ToString());
//            }
//            finally
//            {
//                // Code to cleanup or finalize
//                // ideal for cleaning up resources,
//                // like closing file streams or database connections.

//                Console.WriteLine("This always executes");
//            }

//            // Don't forget to listen to these trace messages

//            Console.WriteLine("Result: " + result);
//            Console.ReadKey();



//        }
//    }
//}




//throw keyword
//using System.Diagnostics;

//namespace TryCatchExceptions
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            Console.WriteLine("Enter your age");
//            GetUserAge(Console.ReadLine());

//            Console.ReadKey();

//        }

//        // What Does throw Do?
//        // The throw keyword in C# is used to indicate that a problem
//        // has occurred in your program
//        // When you use throw, you're essentially saying,
//        // "Hey, something went wrong here, and I can't handle it by myself." 
//        // You're creating an error on purpose, which is called an exception.

//        // Why use throw?
//        /*
//         * 1. To Stop Bad Things from Happening: If something in your program 
//         * isn't right, like if a necessary file is missing or a number
//         * that should never be zero is zero, using throw stops the program
//         * before any more damage can happen.
//         * 
//         * 2. To Tell Other Parts of Your Program about the Problem: 
//         * Sometimes, one part of your program might not know 
//         * how to fix a problem, but another part does. By using throw,
//         * the first part can let the second part handle the issue.
//         * 
//         */

//        static int GetUserAge(string input)
//        {
//            int age;
//            if (!int.TryParse(input, out age))
//            {
//                throw new Exception("You didn't enter a valid age.");
//            }
//            if (age < 0 || age > 120)
//            {
//                throw new Exception("Your age must be between 0 and 120.");
//            }
//            return age;
//        }
//    }
//} 




//managing multiple Types of Exceptions
//using System.Diagnostics;

//namespace TryCatchExceptions
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            int result = 0;

//            Debug.WriteLine("Main method is running");

//            try
//            {
//                Console.WriteLine("Please enter a number");
//                int num1 = int.Parse(Console.ReadLine());
//                //int num1 = 0;
//                int num2 = 2;
//                result = num2 / num1;
//            }
//            catch (DivideByZeroException ex)
//            {
//                Console.WriteLine("DONT DIVIDE BY ZERO!!! " + ex.Message);
//                result = 10;
//            }
//            catch (FormatException ex)
//            {
//                Console.WriteLine("I TOLD YOU TO ENTER A NUMBER!" + ex.Message);
//            }
//            catch (OverflowException ex)
//            {
//                Console.WriteLine("NUMBER TOO HIGH!");
//            }

//            catch (Exception ex)
//            {
//                Console.WriteLine("Error: " + ex.ToString());
//                // This next line is only executed during "Debugging"

//            }
//            finally
//            {
//                // Code to cleanup or finalize
//                // ideal for cleaning up resources,
//                // like closing file streams or database connections.

//                Console.WriteLine("This always executes");
//            }

//            // Don't forget to listen to these trace messages

//            Console.WriteLine("Result: " + result);
//            Console.ReadKey();



//        }
//    }
//}






//How exceptions work with the call stack

using System.Diagnostics;

namespace TryCatchExceptions
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("App running before the try block");
            try
            {
                LevelOne();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception caught in Main: " + ex.Message);
            }
            Console.WriteLine("App is still running!");
            Console.ReadKey();
        }

        static void LevelOne()
        {
            LevelTwo();
        }

        static void LevelTwo()
        {
            Console.WriteLine("Level two before throw!");
            throw new FormatException("Something went wrong!");
            Console.WriteLine("Level two After throw!");
        }
    }
}