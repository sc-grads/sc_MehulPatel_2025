//using System;
//using System.Collections.Generic;
//using System.Data;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

//namespace ClassesApp
//{
//    // It's internal, which means that 
//    //it can only be accessed from
//    //within the same assembly.
//    internal class Car
//    {
//        // member variable
//        // private hides the variable from other classes
//        private string _model = "";

//        private string _brand = "";

//        // Property

//        public string Model { get => _model; set => _model = value; }
//        public string Brand
//        {
//            get => _brand;

//            set
//            {
//                if (string.IsNullOrEmpty(value))
//                {
//                    Console.WriteLine("You entered NOTHING!");
//                    _brand = "DEFAULTVALUE";
//                }
//                else
//                {
//                    _brand = value;
//                }
//            }

//        }

//        // Custom Constructor
//        public Car(string model, string brand)
//        {
//            Model = model;
//            Brand = brand;
//            Console.WriteLine($"A {Brand} of the" +
//                $" model {Model} has been created");
//        }
//    }
//}




//using System;
//using System.Collections.Generic;
//using System.Data;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

//namespace ClassesApp
//{
//    // It's internal, which means that 
//    //it can only be accessed from
//    //within the same assembly.
//    internal class Car
//    {
//        // member variable
//        // private hides the variable from other classes
//        private string _model = "";

//        private string _brand = "";

//        private bool _isLuxury;

//        // Property
//        // With lambda expression
//        public string Model { get => _model; set => _model = value; }

/*
public string Model
{
    get
    {
        return _model;
    } 
    set
    {
        _model = value;
    }
}
*/
//        public string Brand
//        {

//            get
//            {
//                if (_isLuxury)
//                {
//                    return _brand + " - Luxury Edition";
//                }
//                else
//                {
//                    return _brand;
//                }
//            }

//            set
//            {
//                if (string.IsNullOrEmpty(value))
//                {
//                    Console.WriteLine("You entered NOTHING!");
//                    _brand = "DEFAULTVALUE";
//                }
//                else
//                {
//                    _brand = value;
//                }
//            }

//        }

//        public bool IsLuxury
//        {
//            get => _isLuxury;
//            set => _isLuxury = value;
//        }

//        // Custom Constructor
//        public Car(string model, string brand, bool isLuxury)
//        {
//            Model = model;
//            Brand = brand;
//            Console.WriteLine($"A {Brand} of the" +
//                $" model {Model} has been created");
//            IsLuxury = isLuxury;
//        }

//        //methods
//        public void Drive()
//        {
//            Console.WriteLine($"I'm a {Model} and I'm driving");
//        }

//    }
//} 





//static fields

namespace ClassesApp
{
    // It's internal, which means that 
    //it can only be accessed from
    //within the same assembly.
    internal class Car
    {

        public static int NumberOfCars = 0;

        // member variable
        // private hides the variable from other classes
        // Backing Field of the Model property
        //private string _model = "";

        private string _brand = "";

        //private bool _isLuxury;

        // Property
        // With lambda expression
        //public string Model { get => _model; set => _model = value; }

        public string Model { get; set; }


        public string Brand
        {

            get
            {
                if (IsLuxury)
                {
                    return _brand + " - Luxury Edition";
                }
                else
                {
                    return _brand;
                }
            }

            set
            {
                if (string.IsNullOrEmpty(value))
                {
                    Console.WriteLine("You entered NOTHING!");
                    _brand = "DEFAULTVALUE";
                }
                else
                {
                    _brand = value;
                }
            }

        }

        public bool IsLuxury { get; set; }

        //public bool IsLuxury { get => _isLuxury; 
        //    set => _isLuxury = value; }

        // Custom Constructor
        public Car(string model, string brand, bool isLuxury)
        {
            NumberOfCars++; //incrementing the number of cars

            Model = model;
            Brand = brand;
            Console.WriteLine($"A {Brand} of the" +
                $" model {Model} has been created");
            IsLuxury = isLuxury;
        }

        public Car()
        {
            NumberOfCars++;
        }

        public void Drive()
        {
            Console.WriteLine($"I'm a {Model} and I'm driving");
        }

    }
}
