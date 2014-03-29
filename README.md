lab2-3
======
Программа написана на языке C#, для запуска на Ubuntu я использовала mono.


В файлах result1.html и result2.html результаты преобразования, выполненного над файлами example1.xml и example2.xml соответственно.


Деплой-инструкция:

1. Установить mono-dmcs:
sudo apt-get install mono-xsp2 mono-xsp2-base
2. Скопировать в одну папку файлы lab.cs, example1.xml, example2.xml, transition.xsl
3. Ввести команду gmcs lab.cs
4. Выполнить ./lab.exe example1.xml transition.xsl
или ./lab.exe example2.xml transition.xsl
(example1.xml и example2.xml - это два XML документа, удовлетворяющих XSD-схеме xsdScheme).

В случае запуска программы с другими файлами следует учитывать, что вначале должен быть XML-файл, а затем - файл с XSLT-преобразованием.
5. Запустить в браузере файл books.html, сгенерированный программой
