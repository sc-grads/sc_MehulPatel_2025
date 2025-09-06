using static Generics.Box<T>;

namespace Generics
{
    internal class Program
    {
        static void Main(string[] args)
        {
            /*Box<int> box = new Box<int>();
            box.Content = 1;
            Console.WriteLine(box.Log());
         

            Box<string> boxStr = new Box<string>();
            boxStr.Content = "Hello World";
            Console.WriteLine(boxStr.Log());/*/

            /*Box<string> boxStr = new Box<string>("Hello World");
            boxStr.UpdateContent("Teaching C# is fun");
            Console.WriteLine(boxStr.GetContent());*/

            Box<int, string> box = new Box<int, string>(100, "One hundred");
            box.DisplayContents();

            Console.ReadLine();
        }
    }
}
