
/*using System;

class MyAdditionCalculator
{
    static void Main()
    {
        int myNumber = 0;
        int myNumber2 = 0;

        Console.WriteLine("Enter a whole number: ");
        string userInput = Console.ReadLine();

        while (!int.TryParse(userInput, out myNumber))
        {
            Console.WriteLine("Invalid input. Please enter a whole number: ");
            userInput = Console.ReadLine();
        }

        Console.WriteLine("Enter another whole number: ");
        userInput = Console.ReadLine();

        while (!int.TryParse(userInput, out myNumber2))
        {
            Console.WriteLine("Invalid input. Please enter a whole number: ");
            userInput = Console.ReadLine();
        }

        int sum = myNumber + myNumber2;
        Console.WriteLine($"The result of {myNumber} and {myNumber2} is {sum}");
        Console.ReadKey();
    }
} */

/* // this is from the video
int myNumber = 0;
int myNumber2 = 0;

// takes the user input and stores it
// Console.ReadLine();
Console.WriteLine("Enter a whole number ");

string userInput = Console.ReadLine();
myNumber = int.Parse(userInput);

userInput = Console.ReadLine();
myNumber2 = int.Parse(userInput);

int sum = myNumber + myNumber2;

// we are adding two strings together and writing them on the console
// string concatination
//Console.WriteLine("The result of " + myNumber + " and " + myNumber2 + " is " + sum);


// string interpolation
Console.WriteLine($"The result of {myNumber}  and  {myNumber2}  is {sum}");

Console.ReadKey();*/

/*//using doubles

double myNumber = 0.0;
double myNumber2 = 0.0;

// takes the user input and stores it
// Console.ReadLine();
Console.WriteLine("Enter a number ");

string userInput = Console.ReadLine();
myNumber = double.Parse(userInput);

userInput = Console.ReadLine();
myNumber2 = double.Parse(userInput);

double sum = myNumber + myNumber2;

// we are adding two strings together and writing them on the console
// string concatination
//Console.WriteLine("The result of " + myNumber + " and " + myNumber2 + " is " + sum);


// string interpolation
Console.WriteLine($"The result of {myNumber}  and  {myNumber2}  is {sum}");

Console.ReadKey(); */

/*chatGPT
using System;
using System.Globalization;

class MyAdditionCalculator
{
    static void Main()
    {
        double myNumber = 0.0;
        double myNumber2 = 0.0;

        Console.WriteLine("Enter a number: ");
        string userInput = Console.ReadLine();
        myNumber = double.Parse(userInput, CultureInfo.InvariantCulture);

        Console.WriteLine("Enter another number: ");
        userInput = Console.ReadLine();
        myNumber2 = double.Parse(userInput, CultureInfo.InvariantCulture);

        double sum = myNumber + myNumber2;

        Console.WriteLine($"The result of {myNumber} and {myNumber2} is {sum}");
        Console.ReadKey();
    }
} */

/*//from video
using System.Globalization;

double myNumber1 = 0.0;
double myNumber2 = 0.0;

// Prints out whatever is in side of ()
Console.WriteLine("Enter a number!");

// takes the user input and stores it
// Variable with the name "userInput" and the data type "string"
// strings are used for text 
string userInput = Console.ReadLine();
//myNumber = int.Parse(Console.ReadLine());
myNumber1 = double.Parse(userInput, CultureInfo.InvariantCulture);

Console.WriteLine("Enter a number!");
userInput = Console.ReadLine();
myNumber2 = double.Parse(userInput, CultureInfo.InvariantCulture);



double sum = myNumber1 + myNumber2;
sum = Math.Round(sum, 2);


// we are adding to strings together and writing them onto the console
// string concatination
//Console.WriteLine("The result of " + myNumber + " and " + myNumber2 + " is " + sum);

// string interpolation
Console.WriteLine($"The result of {myNumber1.ToString(CultureInfo.InvariantCulture)} " +
    $"and {myNumber2.ToString(CultureInfo.InvariantCulture)} is {sum.ToString(CultureInfo.InvariantCulture)}");

Console.ReadKey(); */
