//namespace ClassesApp
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            // Creating an object of the Class Car
//            // Creating an instance of the Class Car
//            Car audi = new Car();
//            Car bmw = new Car();

//            Console.ReadKey();
//        }
//    }
//}



//Memember variable and Custom Constructor
//namespace ClassesApp
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            // Creating an object of the Class Car
//            // Creating an instance of the Class Car
//            Car audi = new Car("A3", "Audi");
//            Car bmw = new Car("i7", "BMW");

//            Console.ReadKey();
//        }
//    }
//} 




////defining how a property is set
//namespace ClassesApp
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            // Creating an object of the Class Car
//            // Creating an instance of the Class Car
//            Car audi = new Car("A3", "Audi");
//            Car bmw = new Car("i7", "BMW");

//            Console.WriteLine("Please enter the Brand name");
//            // "SETTING BRAND"
//            audi.Brand = "CAR";

//            // GETTING BRAND
//            Console.WriteLine("Brand is " + audi.Brand);


//            Console.ReadKey();
//        }
//    }
//}




//Methods in classes

//namespace ClassesApp
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            Car myAudi = new Car("A3", "Audi", false);
//            myAudi.Drive();

//            Car myBmw = new Car("i7", "BMW", true);
//            myBmw.Drive();

//            Console.WriteLine();
//            Console.ReadKey();
//        }
//    }
//}





//methods in classes in more detail

//namespace ClassesApp
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            Customer earl = new Customer("Earl");
//            Customer frankTheTank = new Customer("FrankTheTank", "Mainstreet 1", "5551234567");
//            //Console.WriteLine("Name of Customer is " + earl.Name);
//            // Default Customer with no Arguments given
//            Customer myCustomer = new Customer();

//            myCustomer.SetDetails("Frank", "Mainstreet 2", "555121312");

//            Console.WriteLine("MyCustomer is: " + myCustomer.Name
//                + " and he lives in " + myCustomer.Address
//                );

//            Console.WriteLine("earl is: " + earl.Name
//                + " and he lives in " + earl.Address
//                );


//            //Console.WriteLine("Details about customer: " + myCustomer.Name);
//            Console.ReadKey();
//        }
//    }
//}




//static methods
//namespace ClassesApp
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {

//            Customer.DoSomeCustomerStuff();
//            Customer myCustomer = new Customer();

//            //The DoSomeCustomerStuff method is static and cannot be called on Objects
//            //myCustomer.DoSomeCustomerStuff();

//            MyMethod();

//            Console.ReadKey();
//        }

//        // In C#, the static keyword is used to declare
//        // members of a class that belong to the class itself
//        // rather than to any specific instance of the class

//        static void MyMethod()
//        {
//            Console.WriteLine("My Method");
//        }



//    }
//}





//static fields

namespace ClassesApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Car car = new Car();
            Car car2 = new Car();
            Car car3 = new Car("A3", "Audi", false);


            // accessing the public static variable NumberOfCars of the Car Class
            Console.WriteLine("Number of cars produced: " + Car.NumberOfCars);


            Console.ReadKey();
        }



    }
}

