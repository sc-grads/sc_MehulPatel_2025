//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

//namespace ClassesApp
//{
//    internal class Customer
//    {
//        public string Name { get; set; }
//        public string Address { get; set; }
//        public string ContactNumber { get; set; }

//        // Default Constructor
//        public Customer()
//        {
//            Name = "New Customer";
//            Address = "Unknown";
//            ContactNumber = "None";
//        }


//        // Custom Constructor
//        public Customer(string name, string address, string contactNumber)
//        {
//            Name = name;
//            Address = address;
//            ContactNumber = contactNumber;
//        }

//        public Customer(string name)
//        {
//            Name = name;
//        }

//        public void SetDetails(string name, string address, string contactNumber)
//        {
//            Name = name;
//            Address = address;
//            ContactNumber = contactNumber;

//        }


//    }
//}




//static methods
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesApp
{
    internal class Customer
    {
        public string Name { get; set; }
        public string Address { get; set; }
        public string ContactNumber { get; set; }

        // Default Constructor
        public Customer()
        {
            Name = "New Customer";
            Address = "Unknown";
            ContactNumber = "None";
        }




        // Default/Optional parameters address and contactNumber 
        public Customer(string name, string address = "NA", string contactNumber = "NA")
        {
            Name = name;
            Address = address;
            ContactNumber = contactNumber;

        }

        // Default Paramter contactNumber
        public void SetDetails(string name, string address, string contactNumber = "NA")
        {
            Name = name;
            Address = address;
            ContactNumber = contactNumber;

        }

        public static void DoSomeCustomerStuff()
        {
            Console.WriteLine("I'm doing some customer stuff");
        }


    }
}
