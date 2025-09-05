using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Generics
{
    // A generic class that can hold a value of any type.
    internal class Box<T>
    {
        public T Content { get; set; }

        public string Log()
        {
            return $"Box contains: {Content}";
        }


        //Video 357
        private T content;

        public Box(T content)
        {
            this.content = content;
        }

        public void UpdateContent(T newContent)
        {
            content = newContent;
            Console.WriteLine($"Content updated to: {content}");
        }

        public T GetContent()
        {
            return content;
        }

    internal class Box<TFirst, TSecond>
    {
        public TFirst First { get; set; }
        public TSecond Second { get; set; }

        public Box(TFirst first, TSecond second)
        {
            First = first;
            Second = second;
        }

        public void DisplayContents()
        {
            Console.WriteLine($"First: {First}, Second: {Second}");
        }
    }

}