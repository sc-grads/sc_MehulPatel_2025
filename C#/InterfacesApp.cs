//namespace InterfacesApp
//{
//    public interface IExample
//    {
//        void Method();
//        int Method2(string parameter);
//    }

//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            Console.WriteLine("Hello, World!");
//        }
//    }


//} 




//implementing and using interfaces
//namespace InterfacesApp
//{
//    public interface IAnimal
//    {
//        void MakeSound();
//        void Eat(string food);
//    }

//    public class Dog : IAnimal
//    {
//        public void Eat(string food)
//        {
//            Console.WriteLine("Dog ate " + food);
//        }

//        public void MakeSound()
//        {
//            Console.WriteLine("Bark");
//        }
//    }


//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            Dog dog = new Dog();
//            dog.MakeSound();
//            dog.Eat("Treat");


//            Console.ReadKey();
//        }
//    }



//}



//solution excercise
//namespace InterfacesApp
//{
//    public interface IAnimal
//    {
//        void MakeSound();
//        void Eat(string food);
//    }

//    public class Dog : IAnimal
//    {
//        public void Eat(string food)
//        {
//            Console.WriteLine("Dog ate " + food);
//        }

//        public void MakeSound()
//        {
//            Console.WriteLine("Bark");
//        }
//    }

//    public class Cat : IAnimal
//    {
//        public void Eat(string food)
//        {
//            Console.WriteLine("Cat eats " + food);
//        }
//        public void MakeSound()
//        {
//            Console.WriteLine("Meow");
//        }

//    }


//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            Dog dog = new Dog();
//            dog.MakeSound();
//            dog.Eat("Treat");

//            Cat cat = new Cat();
//            cat.MakeSound();
//            cat.Eat("Fish");


//            Console.ReadKey();
//        }
//    }



//} 



//second part of ploymorphism
//namespace InterfacesApp
//{
//    public class Animal
//    {
//        public virtual void MakeSound()
//        {
//            Console.WriteLine("Some generic animal sound");
//        }
//    }

//    public class Dog : Animal
//    {
//        public override void MakeSound()
//        {
//            Console.WriteLine("Bark");
//        }
//    }

//    public class Cat : Animal
//    {
//        public override void MakeSound()
//        {
//            Console.WriteLine("Meow");
//        }
//    }

//    internal class Program
//    {
//        static void Main(string[] args)
//        {

//            // Part 2 of Polymorphism
//            Animal mySomething = new Dog();
//            mySomething.MakeSound();



//            Console.ReadKey();
//        }
//    }



//}



//interface Resuability while using Polymorphism


//using System;

//namespace InterfacesApp
//{
//    // 1. Define the interface
//    public interface IPaymentProcessor
//    {
//        void ProcessPayment(decimal amount);
//    }

//    // 2. Implement the interface: Credit Card Processor
//    public class CreditCardProcessor : IPaymentProcessor
//    {
//        public void ProcessPayment(decimal amount)
//        {
//            Console.WriteLine($"Processing credit card payment of {amount}");
//            // Actual credit card logic would go here
//        }
//    }

//    // 3. Implement the interface: PayPal Processor
//    public class PayPalProcessor : IPaymentProcessor
//    {
//        public void ProcessPayment(decimal amount)
//        {
//            Console.WriteLine($"Processing PayPal payment of {amount}");
//            // Actual PayPal logic would go here
//        }
//    }

//    // 4. Payment Service that uses the interface
//    public class PaymentService
//    {
//        private readonly IPaymentProcessor _processor;

//        public PaymentService(IPaymentProcessor processor)
//        {
//            _processor = processor;
//        }

//        public void ProcessOrderPayment(decimal amount)
//        {
//            _processor.ProcessPayment(amount);
//        }
//    }

//    // 5. Program entry point
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            // Using Credit Card Processor
//            IPaymentProcessor creditCard = new CreditCardProcessor();
//            PaymentService service1 = new PaymentService(creditCard);
//            service1.ProcessOrderPayment(100m); // Output: Processing credit card payment of 100

//            // Using PayPal Processor
//            IPaymentProcessor paypal = new PayPalProcessor();
//            PaymentService service2 = new PaymentService(paypal);
//            service2.ProcessOrderPayment(200m); // Output: Processing PayPal payment of 200

//            Console.ReadKey();
//        }
//    }
//}




////Logs
//namespace InterfacesApp
//{


//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            // The @ sign in C# is used to denote a verbatim string literal
//            string directoryPath = @"C:\Logs";
//            string filePath = Path.Combine(directoryPath, "log.txt");
//            string message = "This is a log entry";

//            if (!Directory.Exists(directoryPath))
//            {
//                Directory.CreateDirectory(directoryPath);
//            }


//            File.AppendAllText(filePath, message + "\n");
//            Console.ReadKey();
//        }
//    }



//}



//Decoupling code and enhancing testability

namespace InterfacesApp
{
    public interface ILogger
    {
        void Log(string message);
    }

    public class FileLogger : ILogger
    {
        public void Log(string message)
        {
            // The @ sign in C# is used to denote a verbatim string literal
            string directoryPath = @"C:\Logs";
            string filePath = Path.Combine(directoryPath, "log.txt");

            if (!Directory.Exists(directoryPath))
            {
                Directory.CreateDirectory(directoryPath);
            }


            File.AppendAllText(filePath, message + "\n");
        }
    }

    public class DatabaseLogger : ILogger
    {
        public void Log(string message)
        {
            // Implement the logic to log a message to a database
            Console.WriteLine($"Logging to database. {message}");
        }
    }

    public class Application
    {
        private readonly ILogger _logger;
        public Application(ILogger logger)
        {
            _logger = logger;
        }

        public void DoWork()
        {
            _logger.Log("Work started");
            // DO ALL THE WORK!
            _logger.Log("WORK DONE!");
        }
    }

    /*
     Decoupling: The Application class depends on the 
    ILogger interface rather than specific implementations 
    like FileLogger or DatabaseLogger. 
    This means you can easily switch the logging mechanism 
    without changing the Application class. 
    */


    internal class Program
    {
        static void Main(string[] args)
        {
            ILogger fileLogger = new FileLogger();
            Application app = new Application(fileLogger);
            app.DoWork();

            ILogger dbLogger = new DatabaseLogger();
            app = new Application(dbLogger);
            app.DoWork();


            Console.ReadKey();
        }
    }



}
