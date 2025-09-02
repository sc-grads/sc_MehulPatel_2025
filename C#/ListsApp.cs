//namespace ListsApp
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            //Declating a list and initializing
//            List<string> colors = new List<string>();

//            colors.Add("red");
//            colors.Add("blue");
//            colors.Add("green");

//            foreach (string color in colors)
//            {
//                Console.WriteLine(color);
//            }


//            Console.ReadKey();

//        }
//    }
//}




//deleting items from a list
//namespace ListsApp
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            // Declaring a list and initializing
//            List<string> colors = new List<string>();

//            // Adding items to the list
//            colors.Add("red");
//            colors.Add("blue");
//            colors.Add("green");
//            colors.Add("red");


//            Console.WriteLine("Current colors in the colors list!");
//            foreach (string color in colors)
//            {
//                Console.WriteLine(color);
//            }

//            bool isDeletingSuccessful = colors.Remove("red");
//            while (isDeletingSuccessful)   //deleting all the reds 
//            {
//                isDeletingSuccessful = colors.Remove("red");
//            }


//            Console.WriteLine("Current colors in the colors list!");
//            foreach (string color in colors)
//            {
//                Console.WriteLine(color);
//            }

//            Console.ReadKey();
//        }
//    }
//}




////sorting a list and using FindAll

//using System.Globalization;

//namespace ListsApp
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            List<int> numbers = new List<int> { 10, 5, 15, 3, 9,25,18 };

//            Console.WriteLine("Unsorted list!");
//            foreach (int number in numbers)
//            {
//                Console.WriteLine(number);
//            }

//            //finding all the numbers in the list that are greater than or equal to 10
//            List<int> higherEqualTen = numbers.FindAll(x=> x >=10);

//            //numbers.Sort();
//            //Console.WriteLine("Sorted List");
//            //foreach (int number in numbers)
//            //{
//            //    Console.WriteLine(number);
//            //}

//            Console.WriteLine("All numbers greater than or qual to 10");
//            foreach (int number in higherEqualTen)
//            {
//                Console.WriteLine(number);
//            }


//            Console.ReadKey();
//        }
//    }
//}



//Predicate and lambda expressions


//using System.Globalization;

//namespace ListsApp
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            List<int> numbers = new List<int> { 10, 5, 15, 3, 9, 25, 18 };

//            Console.WriteLine("Unsorted list!");
//            foreach (int number in numbers)
//            {
//                Console.WriteLine(number);
//            }

//            // Define the predicate to check if a number is greater than 10
//            Predicate<int> isGreaterThanTen = x => x > 10;

//            List<int> higherTen = numbers.FindAll(isGreaterThanTen);


//            Console.WriteLine("All number 10 and higher in our list numbers");
//            foreach (int number in higherTen)
//            {
//                Console.WriteLine(number);
//            }


//            Console.ReadKey();
//        }


//        // A lambda expression consists of 2 Parts
//        // 1. Parameters
//        // 2. Expression or Statement Block

//        // Parameters are written on the left side of =>
//        // (this symbol is read as "goes to" or "becomes").
//        // The expression or action to perform is on the right side.

//        //This reads as:
//        //"Take an input x and turn it into x multiplied by x."
//        //x => x * x;

//        static int Squaring(int num1)
//{
//    return num1 * num1;
//}
//    }
//}




////Predicaes and Delegates

//using System.Globalization;

//namespace ListsApp
//{
//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            List<int> numbers = new List<int> { 10, 5, 15, 3, 9, 25, 18 };

//            Console.WriteLine("Unsorted list!");
//            foreach (int number in numbers)
//            {
//                Console.WriteLine(number);
//            }


//            /*
//             In C#, a delegate is like a pointer or a reference to a method. 
//            It allows you to pass methods as arguments to other methods, 
//            store them in variables, and call them later. 
//            This is useful when you want your code to be flexible and 
//            able to handle different behaviors that aren't predetermined. 

//             */


//            // Define the predicate to check if a number is greater than 10
//            Predicate<int> isGreaterThanTen = x => x > 10;

//            List<int> higherTen = numbers.FindAll(isGreaterThanTen);


//            Console.WriteLine("All number 10 and higher in our list numbers");
//            foreach (int number in higherTen)
//            {
//                Console.WriteLine(number);
//            }


//            Console.ReadKey();
//        }

//        public static bool IsGreaterThanTen(int x)
//        {
//            return x > 10;
//        }

//        // A lambda expression consists of 2 Parts
//        // 1. Parameters
//        // 2. Expression or Statement Block

//        // Parameters are written on the left side of =>
//        // (this symbol is read as "goes to" or "becomes").
//        // The expression or action to perform is on the right side.

//        //This reads as:
//        //"Take an input x and turn it into x multiplied by x."
//        //x => x * x;

//        static int Squaring(int num1)
//        {
//            return num1 * num1;
//        }
//    }
//}




//Using Lists with complex Objects

//using System.Globalization;

//namespace ListsApp
//{
//    public class Product
//    {
//        public string Name { get; set; }
//        public double Price { get; set; }
//    }


//    internal class Program
//    {
//        static void Main(string[] args)
//        {

//            // Declare a list of complex objects with initial values
//            List<Product> products = new List<Product>{
//                new Product { Name = "Apple", Price = 0.80 },
//                new Product { Name = "Banana", Price = 0.30 },
//                new Product { Name = "Cherry", Price = 3.80 },

//            };
//            // add items to the list
//            products.Add(new Product { Name = "Berries", Price = 2.99 });


//            Console.WriteLine("Available Products: ");

//            // itterate through the list
//            foreach (Product product in products)
//            {
//                Console.WriteLine($"Product name: {product.Name} for {product.Price}");
//            }


//            Console.ReadKey();

//        }



//    }

//}




//LINQ
//using System.Globalization;

//namespace ListsApp
//{
//    public class Product
//    {
//        public string Name { get; set; }
//        public double Price { get; set; }
//    }


//    internal class Program
//    {
//        static void Main(string[] args)
//        {

//            // Declare a list of complex objects with initial values
//            List<Product> products = new List<Product>{
//                new Product { Name = "Apple", Price = 0.80 },
//                new Product { Name = "Banana", Price = 0.30 },
//                new Product { Name = "Cherry", Price = 3.80 },

//            };
//            // add items to the list
//            products.Add(new Product { Name = "Berries", Price = 2.99 });

//            List<Product> cheapProducts = products.Where(p => p.Price < 1.0).ToList();


//            Console.WriteLine("Available Products for less than $1: ");

//            // itterate through the list
//            foreach (Product product in cheapProducts)
//            {
//                Console.WriteLine($"Product name: {product.Name} for {product.Price}");
//            }


//            Console.ReadKey();

//        }



//    }





//Legacy ArrayLists
//using System;
//using Systen.Collections;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

//namespace ListApp
//{
//    class Program
//    {
//        static void Main(string[] args)
//        {
//            //Declaring an ArrayList 
//            ArrayList myArrayList = new ArrayList();        // unlimited size
//            ArrayList myArrayList = new ArrayList(100);     // with capacity for 100 items

//            myArrayList.Add(25);         // int
//            myArrayList.Add("Hello");    // string
//            myArrayList.Add(13.37);      // double
//            myArrayList.Add(13);
//            myArrayList.Add(128);
//            myArrayList.Add(25.3);

//            myArrayList.Remove(13);      // removes the first "13" it finds
//            myArrayList.RemoveAt(0);     // removes the item at index 0
//            myArrayList.Clear();         // removes all items

//            Console.WriteLine(myArrayList.Count);

//            double = sum = 0;

//            foreach (object obj in myArrayList)
//            {
//                if (obj is int)
//                {
//                    // convert int to double for sum
//                    sum += Convert.ToDouble(obj);
//                }
//                else if (obj is double)
//                {
//                    // cast directly
//                    sum += (double)obj;
//                }
//                else if (obj is string)
//                {
//                    Console.WriteLine(obj);
//                }
//            }
//            Console.WriteLine(sum);
//            Console.ReadKey();


//        }
//    }
//} 




//Dictionaries Part 1- Declaring, Intializing and Adding Items
//namespace Dictionaries
//{
//    internal class ListsApp
//    {
//        static void Main(string[] args)
//        {
//            // key - value
//            // Declaring and initializing a Dictionary
//            Dictionary<int, string> employees = new Dictionary<int, string>();

//            // Adding Items to a Dictionary
//            employees.Add(101, "John Doe");
//            employees.Add(102, "Bob Smith");

//            // access items in a dictionary
//            string name = employees[101];
//            Console.WriteLine(name);



//            Console.ReadKey();
//        }
//    }
//}




//Dictionaries Part 2- Updating, Removing entries and Iterating through Dictionaries
//{
//    internal class Program
//{
//    static void Main(string[] args)
//    {
//        // key - value
//        // Declaring and initializing a Dictionary
//        Dictionary<int, string> employees = new Dictionary<int, string>();

//        // Adding Items to a Dictionary
//        employees.Add(101, "John Doe");
//        employees.Add(102, "Bob Smith");
//        employees.Add(103, "Rob Smith");
//        employees.Add(104, "Flob Smith");
//        employees.Add(105, "Dob Smith");

//        // access items in a dictionary
//        string name = employees[101];
//        //Console.WriteLine(name);

//        // update data in a dictionary
//        employees[102] = "Jane Smith";

//        // remove an item from a dictionary
//        employees.Remove(101);


//        // Iterating over a dictionary
//        foreach (KeyValuePair<int, string> employee in employees)
//        {
//            Console.WriteLine($"ID: {employee.Key}, Name: {employee.Value}");
//        }



//        Console.ReadKey();
//    }
//} 






//Gracefully Adding and Updating Dictionaries
namespace Dictionaries
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // key - value
            // Declaring and initializing a Dictionary
            Dictionary<int, string> employees = new Dictionary<int, string>();

            // Adding Items to a Dictionary
            employees.Add(101, "John Doe");
            employees.Add(102, "Bob Smith");
            employees.Add(103, "Rob Smith");
            employees.Add(104, "Flob Smith");
            employees.Add(105, "Dob Smith");

            // access items in a dictionary
            string name = employees[101];
            //Console.WriteLine(name);

            // update data in a dictionary
            employees[102] = "Jane Smith";

            // remove an item from a dictionary
            employees.Remove(101);



            if (!employees.ContainsKey(104))
            {
                employees.Add(104, "Mike Jike");
            }

            bool added = employees.TryAdd(102, "Michal Brims");
            if (!added)
            {
                Console.WriteLine("Employee with the id of 102 already exists");
            }

            /*
            int counter = 101;

            while (employees.ContainsKey(counter))
            {
                counter++;
            }
            employees.Add(counter, "Jesus Christ");
            */

            // Iterating over a dictionary
            foreach (KeyValuePair<int, string> employee in employees)
            {
                Console.WriteLine($"ID: {employee.Key}, Name: {employee.Value}");
            }



            Console.ReadKey();
        }
    }
}




