namespace WeatherStationSimulator
{
    // The Program class contains our Main method (entry point of the application)
    internal class Program
    {
        // Main method: execution starts here
        public static void Main(string[] args)
        {
            // Ask the user for how many days they want to simulate
            Console.WriteLine("Enter number of days to simulate: ");

            // Try to read the user's input and convert it to an integer
            // int.TryParse checks if the input is a valid integer
            // If it's not valid OR if the number is <= 0, we show an error message and stop the program
            //Out int days checks to see if the passing works and it saves the number in the variables days
             
            if (!int.TryParse(Console.ReadLine(), out int days) || days <= 0)
            {
                Console.WriteLine("Please enter a valid positive number.");
                return; // Ends the program early
            }

            // Create an integer array to store temperatures for 'days' number of days
            int[] temp = new int[days];

            // Possible weather conditions
            string[] conditions = { "Sunny", "Rainy", "Cloudy", "Snowy" };

            // Create another array to hold the randomly chosen weather condition for each day
            string[] weatherConditions = new string[days];

            // Create a Random object to generate random numbers
            Random random = new Random();

            // Loop through each day
            for (int i = 0; i < days; i++)
            {
                // Generate a random temperature between -10 and 39
                temp[i] = random.Next(-10, 40);

                // Pick a random weather condition from the list (Sunny/Rainy/Cloudy/Snowy)
                weatherConditions[i] = conditions[random.Next(conditions.Length)];
            }

            // Print the average temperature using the avgTemp method
            Console.WriteLine("Average temp is: " + avgTemp(temp));

            // Print the maximum temperature using LINQ's built-in Max() method
            Console.WriteLine($"The max temp was {temp.Max()}");

            // Print the minimum temperature using our custom min() method
            Console.WriteLine($"The min temp was {min(temp)}");

            // Print the most common weather condition using our custom mostCommonCondition() method
            Console.WriteLine($"Most common condition is {mostCommonCondition(weatherConditions)}");
        }

        // Method to calculate the average temperature
        static double avgTemp(int[] temp)
        {
            double sum = 0;

            // Add up all the temperatures
            for (int i = 0; i < temp.Length; i++)
            {
                sum += temp[i];
            }

            // Divide the total by the number of days to get the average
            double avg = sum / temp.Length;

            return avg; // Return the result
        }

        // Method to find the minimum temperature
        static int min(int[] temp)
        {
            // Assume the first value is the minimum
            int min = temp[0];

            // Loop through the array
            for (int i = 0; i < temp.Length; i++)
            {
                // If we find a smaller number, update 'min'
                if (temp[i] < min)
                {
                    min = temp[i];
                }
            }
            return min; // Return the smallest value
        }

        // Method to find the most common weather condition
        static string mostCommonCondition(string[] weatherConditions)
        {
            // Start with the first condition as the most common
            string mostCommon = weatherConditions[0];

            // Keep track of how many times the most common condition appears
            int maxCount = 0;

            // Outer loop: check each condition
            for (int i = 0; i < weatherConditions.Length; i++)
            {
                int currentCount = 0; // Count how many times the current condition appears

                // Inner loop: compare the current condition with every other one
                for (int j = 0; j < weatherConditions.Length; j++)
                {
                    if (weatherConditions[j] == weatherConditions[i])
                    {
                        currentCount++;
                    }
                }

                // If this condition appears more times than our previous best, update mostCommon
                if (currentCount > maxCount)
                {
                    maxCount = currentCount;
                    mostCommon = weatherConditions[i];
                }
            }
            return mostCommon; // Return the most frequent condition
        }

    }
}