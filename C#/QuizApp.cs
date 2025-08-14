//string question1 = "What is the capital of Germany";
//string answer1 = "Berlin";

//string question2 = "What is 2+2";
//string answer2 = "4";

//string question3 = "What color do you get by mixing blue and yellow";
//string answer3 = "Green";

//int score = 0;

//Console.WriteLine(question1);
//string userAnswer1 = Console.ReadLine();
//if (userAnswer1 == answer1)
//{
//    Console.WriteLine("Correct!");
//    score = score + 1;
//}
//else
//{
//    Console.WriteLine("Wrong, the correct answer is: " + answer1);
//}

//Console.WriteLine(question2);
//string userAnswer2 = Console.ReadLine();
//if (userAnswer2 == answer2)
//{
//    Console.WriteLine("Correct!");
//    score = score + 1;
//}
//else
//{
//    Console.WriteLine("Wrong, the correct answer is: " + answer2);
//}


//Console.WriteLine(question3);
//string userAnswer3 = Console.ReadLine();
//if (userAnswer3 == answer3)
//{
//    Console.WriteLine("Correct!");
//    score = score + 1;
//}
//else
//{
//    Console.WriteLine("Wrong, the correct answer is: " + answer3);
//}

//Console.WriteLine($"Quiz completed! Your final score is: {score}/3");
//if (score == 3)
//{
//    Console.WriteLine("Excellent! You got all the answers right!");
//}
//else if (score > 0)
//{
//    Console.WriteLine("Good Job, but keep learning!");
//}
//else
//{
//    Console.WriteLine("Try again and see if you can get some answers right next time!");
//}



//Console.ReadKey();

//using stringmethods trim and tolower
//string question1 = "What is the capital of Germany";
//string answer1 = "Berlin";

//string question2 = "What is 2+2";
//string answer2 = "4";

//string question3 = "What color do you get by mixing blue and yellow";
//string answer3 = "Green";

//int score = 0;
//Console.WriteLine(question1);
//string userAnswer1 = Console.ReadLine();
//if (userAnswer1.Trim().ToLower() == answer1.ToLower())
//{

//    Console.WriteLine("Correct!");
//    //score = score+1;
//    score++;
//}
//else
//{
//    Console.WriteLine("Wrong, the correct answer is: " + answer1);
//}

//Console.WriteLine(question2);
//string userAnswer2 = Console.ReadLine();
//if (userAnswer2.Trim().ToLower() == answer2.ToLower())
//{
//    Console.WriteLine("Correct!");
//    score = score + 1;
//}
//else
//{
//    Console.WriteLine("Wrong, the correct answer is: " + answer2);
//}


//Console.WriteLine(question3);
//string userAnswer3 = Console.ReadLine();
//if (userAnswer3.Trim().ToLower() == answer3.ToLower())
//{
//    Console.WriteLine("Correct!");
//    score = score + 1;
//}
//else
//{
//    Console.WriteLine("Wrong, the correct answer is: " + answer3);
//}

//Console.WriteLine($"Quiz completed! Your final score is: {score}/3");
//if (score == 3)
//{
//    Console.WriteLine("Excellent! You got all the answers right!");
//}
//else if (score > 0)
//{
//    Console.WriteLine("Good Job, but keep learning!");
//}
//else
//{
//    Console.WriteLine("Try again and see if you can get some answers right next time!");
//}



//Console.ReadKey();

//incrementing and pre-incrementing

int num = 0;

Console.WriteLine($"Num is {num}");
// incrementing of int
num++;
Console.WriteLine($"Num is {num}");

// pre-incrementing
Console.WriteLine("Num is {0}", ++num);
Console.WriteLine("Num is {0}", num++);
Console.WriteLine("Num is {0}", num);
Console.ReadLine();

//decrementing and modulo oprator
int num1 = 10;
int num2 = 3;

// Modulo Operator
int result = num1 % num2;
//10/3 = 3 remainder 1


Console.WriteLine(result);

//Console.WriteLine($"Num is {num}");

//// pre-incrementing
//Console.WriteLine("Num is {0}", ++num);
//Console.WriteLine("Num is {0}", num++);
//Console.WriteLine("Num is {0}", num);

//// decrementing
//num--;
//Console.WriteLine("Num is {0}", num);
//Console.WriteLine("Num is {0}", --num);
//Console.WriteLine("Num is {0}", num--);
//Console.WriteLine("Num is {0}", num);
/*
num += 30;
Console.WriteLine("Num is {0}", num);
num -= 10;
Console.WriteLine("Num is {0}", num);
num *= 10;
Console.WriteLine("Num is {0}", num);
num /= 20;
Console.WriteLine("Num is {0}", num);

*/


//Console.ReadLine();

//try and parse
Console.WriteLine("Give me a number");
string inputString = Console.ReadLine();
int num1 = 0;

bool isNumber = int.TryParse(inputString, out num1);

if (isNumber)
{
    Console.WriteLine("Well done, you entered a number");
}
else
{
    Console.WriteLine("Haha you troll. You should've entered a number");
}



Console.ReadKey();

// creating an instance of the Random Class
Random random = new Random();
// this will give us a random  number between 1 and 10
int randomNumber = random.Next(1, 11);

Console.WriteLine("Guess the number");

string inputString = Console.ReadLine();
int num1 = 0;

bool isNumber = int.TryParse(inputString, out num1);

if (isNumber)
{
    if (num1 == randomNumber)
    {
        Console.WriteLine("You guessed right!");
    }
    else
    {
        Console.WriteLine("You guessed wrong, try again!");
    }
}
else
{
    Console.WriteLine("Haha you troll. You should've entered a number");
}
Console.ReadKey();