using System;

public class HelloWorld
{
    public static void Main(string[] args)
    {
        while (true)
        {
            Console.WriteLine("Hello World");

            Console.WriteLine("Enter First Num:");
            double firstnum = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine(firstnum);

            Console.WriteLine("Enter Second Num:");
            double Secondnum = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine(Secondnum);

            Console.Write("Enter operator (+, -, *, /): ");
            char op = Console.ReadKey().KeyChar;
            Console.WriteLine();

            double result = 0;
            if (op == '+')
                result = firstnum + Secondnum;
            else if (op == '-')
                result = firstnum - Secondnum;
            else if (op == '*')
                result = firstnum * Secondnum;
            else if (op == '/')
            {
                if (Secondnum == 0)
                {
                    Console.WriteLine("error can't divide by 0");
                    continue;
                }
                result = firstnum / Secondnum;
            }
            else
            {
                Console.WriteLine("Invalid operator");
                continue;
            }
            Console.WriteLine("Result: " + result);
        } 
    }
}
