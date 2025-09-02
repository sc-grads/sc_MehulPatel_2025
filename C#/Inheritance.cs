//namespace InheritanceApp
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {


//            Dog myDog = new Dog();
//            myDog.Eat();   // Inherited from Animal
//            myDog.Bark();  // Specific to Dog

//            Console.WriteLine("Hello, World!");
//        }
//    }

//    //Base Class
//    class Animal
//    {
//        public void Eat()
//        {
//            Console.WriteLine("Eating...");
//        }
//    }

//    // Derived class
//    class Dog : Animal
//    {
//        public void Bark()
//        {
//            Console.WriteLine("Barking...");
//        }
//    }
//}



//Types of inheritance
//namespace InheritanceApp
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            Dog myDog = new Dog();
//            myDog.Bark();
//            myDog.Eat();

//            Console.ReadKey();
//        }
//    }

//    // Base Class  (Parent Class or Superclass): The class whose members are inherited
//    class Animal
//    {
//        public void Eat()
//        {
//            Console.WriteLine("Eating...");
//        }
//    }

//    //Derived Class(Child Class or Subclass):
//    //The class that inherits the members of the base class.
//    class Dog : Animal
//    {
//        public void Bark()
//        {
//            Console.WriteLine("Barking...");
//        }
//    }

//    class Cat : Animal
//    {
//        public void Miau()
//        {
//            Console.WriteLine("Cat is meowing");
//        }
//    }

//    // A breed of dog
//    class Collie : Dog
//    {
//        public void GoingNuts()
//        {
//            Console.WriteLine("Collie going Nuts");
//        }
//    }

//}



//method overriding
//namespace InheritanceApp
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            Dog myDog = new Dog();
//            myDog.MakeSound();

//            Cat myCat = new Cat();
//            myCat.MakeSound();


//            Console.ReadKey();
//        }
//    }

//    // Base Class  (Parent Class or Superclass): The class whose members are inherited
//    class Animal
//    {
//        public void Eat()
//        {
//            Console.WriteLine("Eating...");
//        }

//        public virtual void MakeSound()
//        {
//            Console.WriteLine("Animal makes a generic sound");
//        }
//    }

//    //Derived Class(Child Class or Subclass):
//    //The class that inherits the members of the base class.
//    class Dog : Animal
//    {
//        public override void MakeSound()
//        {
//            Console.WriteLine("Barking...");
//        }
//    }

//    class Cat : Animal
//    {
//        public override void MakeSound()
//        {
//            Console.WriteLine("Cat is meowing");
//        }
//    }


//    // A breed of dog
//    class Collie : Dog
//    {
//        public void GoingNuts()
//        {
//            Console.WriteLine("Collie going Nuts");
//        }
//    }


//}




//Constructor Inheritance 1- Base Keyword with Constructors and how properties are
//namespace InheritanceApp
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            Employee joe = new Employee("Joe", 36);
//            joe.DisplayPersonInfo();
//            Console.ReadKey();
//        }
//    }

//    public class Person
//    {
//        public string Name { get; private set; }
//        public int Age { get; private set; }
//        // Base class constructor
//        public Person(string name, int age)
//        {
//            Name = name;
//            Age = age;
//            Console.WriteLine("Person constructor called");
//        }

//        public void DisplayPersonInfo()
//        {
//            Console.WriteLine($"Name: {Name}, Age: {Age}");
//        }
//    }

//    public class Employee : Person
//    {
//        public Employee(string name, int age) : base(name, age)
//        {

//            Console.WriteLine("Employee (derived class) constructor called");
//        }
//    }


//}



////Constructor inheritance

//namespace InheritanceApp
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            Employee joe = new Employee("Joe", 36, "Sales Rep", 12345);
//            joe.DisplayEmployeeInfo();

//            Console.ReadKey();
//        }
//    }

//    public class Person
//    {
//        public string Name { get; private set; }
//        public int Age { get; private set; }

//        // Base class constructor
//        public Person(string name, int age)
//        {
//            Name = name;
//            Age = age;
//            Console.WriteLine("Person constructor called");
//        }

//        public void DisplayPersonInfo()
//        {
//            Console.WriteLine($"Name: {Name}, Age: {Age}");
//        }
//    }


//    public class Employee : Person
//    {
//        public string JobTitle { get; private set; }
//        public int EmployeeID { get; private set; }

//        // Derived class constructor
//        public Employee(string name, int age, string jobTitle, int employeeID)
//            : base(name, age) // Calling the base class constructor
//        {
//            JobTitle = jobTitle;
//            EmployeeID = employeeID;
//            Console.WriteLine("Employee constructor called");
//        }

//        public void DisplayEmployeeInfo()
//        {
//            DisplayPersonInfo(); // Call method from base class
//            Console.WriteLine($"Job Title: {JobTitle}, Employee ID: {EmployeeID}");
//        }
//    }

//}




////Multiple dervived classes
//namespace InheritanceApp
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            //Employee joe = new Employee("Joe", 36, "Sales Rep", 12345);
//            //joe.DisplayEmployeeInfo();

//            Manager carl = new Manager("Carl", 45, "Manager", 123123, 7);
//            carl.DisplayManagerInfo();
//            Console.ReadKey();
//        }
//    }

//    public class Person
//    {
//        public string Name { get; private set; }
//        public int Age { get; private set; }

//        // Base class constructor
//        public Person(string name, int age)
//        {
//            Name = name;
//            Age = age;
//            Console.WriteLine("Person constructor called");
//        }

//        public void DisplayPersonInfo()
//        {
//            Console.WriteLine($"Name: {Name}, Age: {Age}");
//        }
//    }


//    public class Employee : Person
//    {
//        public string JobTitle { get; private set; }
//        public int EmployeeID { get; private set; }

//        // Derived class constructor
//        public Employee(string name, int age, string jobTitle, int employeeID)
//            : base(name, age) // Calling the base class constructor
//        {
//            JobTitle = jobTitle;
//            EmployeeID = employeeID;
//            Console.WriteLine("Employee constructor called");
//        }

//        public void DisplayEmployeeInfo()
//        {
//            DisplayPersonInfo(); // Call method from base class
//            Console.WriteLine($"Job Title: {JobTitle}, Employee ID: {EmployeeID}");
//        }
//    }

//    public class Manager : Employee
//    {
//        public int TeamSize { get; private set; }

//        public Manager(string name, int age, string jobTitle,
//            int employeeID, int teamSize)
//            : base(name, age, jobTitle, employeeID)
//        {
//            TeamSize = teamSize;
//        }

//        public void DisplayManagerInfo()
//        {
//            DisplayEmployeeInfo(); // Call method from base class
//            Console.WriteLine($"Team Size: {TeamSize}");
//        }
//    }

//}



