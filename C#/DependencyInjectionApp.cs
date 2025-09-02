//namespace DependencyInjectionApp
//{
//    public class Hammer
//    {
//        public void Use()
//        {
//            Console.WriteLine("Hammering Nails!");
//        }
//    }

//    public class Saw
//    {
//        public void Use()
//        {
//            Console.WriteLine("Sawing wood!");
//        }
//    }

//    public class Builder
//    {
//        private Hammer _hammer;
//        private Saw _saw;

//        public Builder()
//        {
//            _hammer = new Hammer(); // Builder is responsible for creating its dependencies
//            _saw = new Saw();
//        }

//        public void BuildHouse()
//        {
//            _hammer.Use();
//            _saw.Use();
//            Console.WriteLine("House built");
//        }

//    }


//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            Console.WriteLine("Hello, World!");
//        }
//    }
//}



//super simple constructor dependency injection
//namespace DependencyInjectionApp
//{
//    public class Hammer
//    {
//        public void Use()
//        {
//            Console.WriteLine("Hammering Nails!");
//        }
//    }

//    public class Saw
//    {
//        public void Use()
//        {
//            Console.WriteLine("Sawing wood!");
//        }
//    }

//    public class Builder
//    {
//        private Hammer _hammer;
//        private Saw _saw;

//        // Constructor Dependency Injection (DI)
//        public Builder(Hammer hammer, Saw saw)
//        {
//            _hammer = hammer;
//            _saw = saw;
//        }

//        public void BuildHouse()
//        {
//            _hammer.Use();
//            _saw.Use();
//            Console.WriteLine("House built");
//        }

//    }


//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            Hammer hammer = new Hammer();
//            Saw saw = new Saw();
//            Builder builder = new Builder(hammer, saw);

//            builder.BuildHouse();

//            Console.ReadLine();
//        }
//    }
//} 



//Setter Dependency injection
//namespace DependencyInjectionApp
//{
//    public class Hammer
//    {
//        public void Use()
//        {
//            Console.WriteLine("Hammering Nails!");
//        }
//    }

//    public class Saw
//    {
//        public void Use()
//        {
//            Console.WriteLine("Sawing wood!");
//        }
//    }

//    public class Builder
//    {
//        public Hammer Hammer { get; set; }
//        public Saw Saw { get; set; }



//        public void BuildHouse()
//        {
//            Hammer.Use();
//            Saw.Use();
//            Console.WriteLine("House built");
//        }

//    }


//    internal class Program
//    {
//        static void Main(string[] args)
//        {
//            Hammer hammer = new Hammer();
//            Saw saw = new Saw();
//            Builder builder = new Builder();
//            builder.Hammer = hammer;
//            builder.Saw = saw;

//            builder.BuildHouse();

//            Console.ReadLine();
//        }
//    }
//} 




//Interface Dependency Injection and Comparison

namespace DependencyInjectionApp
{
    public interface IToolUser
    {
        void SetHammer(Hammer hammer);
        void SetSaw(Saw saw);
    }

    public class Hammer
    {
        public void Use()
        {
            Console.WriteLine("Hammering Nails!");
        }
    }

    public class Saw
    {
        public void Use()
        {
            Console.WriteLine("Sawing wood!");
        }
    }

    public class Builder : IToolUser
    {
        private Hammer _hammer;
        private Saw _saw;




        public void BuildHouse()
        {
            _hammer.Use();
            _saw.Use();
            Console.WriteLine("House built");
        }

        public void SetHammer(Hammer hammer)
        {
            _hammer = hammer;
        }

        public void SetSaw(Saw saw)
        {
            _saw = saw;
        }
    }


    internal class Program
    {
        static void Main(string[] args)
        {
            Hammer hammer = new Hammer(); // Create the dependencies outside
            Saw saw = new Saw();
            Builder builder = new Builder();
            builder.SetHammer(hammer);
            builder.SetSaw(saw);


            builder.BuildHouse();

            Console.ReadLine();
        }
    }
}
