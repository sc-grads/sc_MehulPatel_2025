// See https://aka.ms/new-console-template for more information
using System;

Console.WriteLine("Hello, World!");


//for loop
//for (int i = 0; i < 10; i++) // i++ is the same as i=i+1
//    {
//        Console.WriteLine("i is" + i);
//    }

//Console.ReadKey();



//for loop countdown

//for (int i = 10; i >= 10; i--) 
//{
//    Console.WriteLine("i is" + i);
//}

//Console.ReadKey();


//Landing a rocket

//string rocket = "     |\r\n     |\r\n    / \\\r\n   / _ \\\r\n  |.o '.|\r\n  |'._.'|\r\n  |     |\r\n ,'|  | |`.\r\n/  |  | |  \\\r\n|,-'--|--'-.|";

//for (int counter = 10; counter >= 0; counter--)
//{
//    Console.Clear();
//    Console.WriteLine("Counter is " + counter);
//    Console.WriteLine(rocket);
//    rocket = "\r\n" + rocket;
//    Thread.Sleep(1000);
//}
//Console.WriteLine("The Rocket has Landed!");

//Console.ReadKey();


//While loop

//Console.WriteLine("Enter go or stay");

//string userChoice = Console.ReadLine();

//while (userChoice == "go")
//{
//    Console.WriteLine("Go for a mile");
//    Console.WriteLine("Wanna keep going? Enter go");
//    userChoice = Console.ReadLine();

//}
//Console.WriteLine("Finally you are staying");

//Console.ReadKey();



//Guess the number application

//Random random = new Random();

//int secretNumber = random.Next(1,101);
//int userGuess = 0;
//int counter = 0;

//Console.WriteLine("Guess the number I am thinking of bwetween 1 and 100");


//while (userGuess != secretNumber)
//{
//    counter++;
//    Console.WriteLine("Enter your guess");
//    userGuess = int.Parse(Console.ReadLine());
//    if (userGuess < secretNumber)
//    {
//        Console.WriteLine("too low try again");
//    }
//    else if (userGuess > secretNumber) 
//    {
//        Console.WriteLine("too high try again");
//    }
//    else
//    {
//        Console.WriteLine("Congradulations! You guessed the number right! It took you " + counter + "tries to get it right");
//    }

//}

//Console.ReadKey();



//Adventure game

//Console.WriteLine("Welcome to the Adventure Game!");
//Console.WriteLine("Enter your character's name: ");
//string playerName = Console.ReadLine();
//Console.WriteLine("Choose your character type (Warrior, Wizard, Archer");
//string characterType = Console.ReadLine();

//Console.WriteLine($"You, {playerName} the {characterType} find yourself at the edge of a dark forest.");
//Console.WriteLine("Do you enter the forest or camp outside? (Enter/Camp)");

//string choice1 = Console.ReadLine();

//if (choice1.ToLower() == "enter")
//{
//    Console.WriteLine("You bravely enter the forest");

//}
//else
//{
//    Console.WriteLine("You decide to camp out and wait for daylight.");
//}

//bool gameContinues = true;

//while (gameContinues)
//{
//    Console.WriteLine("You come to a fork in the road. Go left or right?");
//    string direction = Console.ReadLine();
//    if (direction.ToLower() == "left")
//    {
//        Console.WriteLine("You find a treasure chest!");
//        gameContinues = false;
//    }
//    else
//    {
//        Console.WriteLine("You encounter a wild beast!");
//        Console.WriteLine("Fight or flee? (fight/flee)");
//        string fightChoice = Console.ReadLine();
//        if (fightChoice.ToLower() == "fight")
//        {
//            Random random = new Random();
//            int luck = random.Next(1, 11);
//            if (luck > 5)
//            {
//                Console.WriteLine("You beat the wild beast!");
//                if (luck > 8)
//                {
//                    Console.WriteLine("The wild beast dropped a treasure!");
//                }
//            }
//            else
//            {
//                Console.WriteLine("The beast attacked you where you didn't expect it!");
//                Console.WriteLine("It rammed it's tusks into your chest and you bleed out!");
//                gameContinues = false;
//            }
//        }
//    }
//}

//Console.WriteLine("Game Over!");
//Console.WriteLine("Thank you for playing the game!");

//Console.ReadKey();



//Do while loops

//int number;

//do
//{
//    Console.WriteLine("Enter a postive whole number");
//    number = int.Parse(Console.ReadLine());
//} while (number <= 0);
//Console.WriteLine("Finally!!!");
//Console.ReadKey();


//avearge calculator

//int currentScore;
//int sum =0 ;
//int counter = 0;
//do
//{
//    Console.WriteLine("Enter your students score. Enter -1 to finish");
//    currentScore = int.Parse(Console.ReadLine());
//    if (currentScore !=-1)
//    {
//        sum = sum + currentScore;
//        counter++;
//    }
//    counter ++;
//} while (currentScore != -1);

//int average = sum / counter;
//Console.WriteLine("The average is : " + average);
//Console.ReadKey();



//Break and continue
//for (int i = 0; i < 10;i++)
//{
//    Console.WriteLine(i);
//    if(i == 3)
//    {
//        Console.WriteLine("I have had enough");
//        continue;
//    }
//    Console.WriteLine("Only if not continued)";
//}

//Console.ReadKey();




//simple array

int num1 = 0;
int num2 = 0;
int num3 = 0;
int num4 = 0;
int num5 = 0;

//// declare an array
//int[] myIntArray = new int[5]; // the new says allocate some space for my array of integers (for 5 integers)

//// assigned values to the array

////int[] myIntArray = [5,12,13,14,15];
//myIntArray[0] = 5;
//myIntArray[1] = 12;
//myIntArray[2] = 13;
//myIntArray[3] = 14;
//myIntArray[4] = 15;

//Console.WriteLine(myIntArray[3]);

//Console.ReadKey();



// Indexes [0][ 1][ 2][ 3][ 4]
// content [5][12][13][14][15]




// declare an array and set the array element values
//int[] myIntArray = [5, 12, 13, 14, 15];

//string[] weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

//Console.WriteLine("Today is " + weekDays[0]);

//Console.ReadKey();



// foreach and length of an array

int num1 = 0;
int num2 = 0;
int num3 = 0;
int num4 = 0;
int num5 = 0;

// declare an array and set the array element values
int[] myIntArray = [1, 2, 3, 4, 5];

string[] weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

Console.WriteLine("Lenght of the weekdays Array is: " + weekDays.Length);

//for (int i = 0; i < weekDays.Length; i++)
//{
//    Console.WriteLine(weekDays[i]);
//}

foreach (string day in weekDays)
{
    Console.WriteLine(day);
}


Console.ReadKey();


//two dimensional arrays
int[,] array2DDeclaration = new int[3, 3];
// [0] [0] [0]
// [0] [0] [0]
// [0] [0] [0]

int[,,] array3DDeclaration = new int[3, 3, 3];


int[,] array2DInizilized = { { 1, 2 }, { 3, 4 } };
// [1] [2]  // row 0
// [3] [4]  // row 1

string[,] ticTacToeField =
{
    {"O","X","X" },
    {"O","O","X" },
    {"X","X","O" }
};

string[,] understandingIndexes =
{
    {"0,0","0,1","0,2" },
    {"1,0","1,1","1,2" },
    {"2,0","2,1","2,2" }
};

Console.WriteLine(understandingIndexes[1, 2]);

Console.ReadKey();



// Indexes [0][ 1][ 2][ 3][ 4]
// content [5][12][13][14][15]



//three dimnensional arrays
int[,,] array3DDeclaration = new int[3, 3, 3];

// initialized 3D Array
string[,,] simple3DArray =
{
    {
        {"000", "001"},
        {"010", "011" }
    },
    {
        {"100", "101"},
        {"110", "111"}
    },
    {
        {"200", "201"},
        {"210", "211"}
    }
};

// assign a value
simple3DArray[2, 1, 0] = "Hi, what's up?";

Console.WriteLine(simple3DArray[2, 1, 0]);


string[,] understandingIndexes =
{
    {"0,0","0,1","0,2" },
    {"1,0","1,1","1,2" },
    {"2,0","2,1","2,2" }
};


Console.ReadKey();



// Indexes [0][ 1][ 2][ 3][ 4]
// content [5][12][13][14][15]