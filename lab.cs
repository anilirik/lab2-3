using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using System.Xml.Xsl;
using System.Xml.XPath;

namespace Lab2
{
    class Program
    {
        static void Main (string[] args)
		{
			if (args.Length != 2 || args[0].Length < 5 || args[1].Length < 5)
			{
				Console.WriteLine ("На вход должно подаваться два файла в указанном порядке:\nисходный xml (.xml) и файл с xslt-преобразованием (.xsl)");
				return;
			}

			StringBuilder sb1, sb2;
			sb1 = new StringBuilder (args [0], args [0].Length - 4, 4, 4);
			sb2 = new StringBuilder (args [1], args [1].Length - 4, 4, 4);

			if (sb1.ToString() != ".xml")
			{
				Console.WriteLine ("Первый файл должен быть формата .xml");
				return;
			}

			if (sb2.ToString() != ".xsl")
			{
				Console.WriteLine ("Второй файл должен быть формата .xsl");
				return;
			}

            XmlReader reader;
            try
            {
                reader = XmlReader.Create(args[0]);
            }
            catch
            {
                Console.WriteLine("Файл " + args[0] + " не найден");
                return;
            }
            
            XmlWriter writer = XmlWriter.Create("books.html");

            
            XslCompiledTransform transform = new XslCompiledTransform();
            XsltSettings settings = new XsltSettings();
            settings.EnableScript = true;
            try
            {
                transform.Load(args[1], settings, null);
            }
            catch
            {
                Console.WriteLine("Файл " + args[1] + " не найден");
                return;
            }
            
            transform.Transform(reader, writer);
        }
    }
}
