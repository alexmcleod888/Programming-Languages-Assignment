files:
    - BookInfo.txt: contains the information for the different books
    - Book.cpp: contains the Book class
    - Book.h: header file for the Book Class 
    - program.cpp: where the program starts, contains the code to read the book information file
      and then sort the books from this file
    - Tests: folder that contains the text files for testing incorrectly formatted book information 
      files
        - Empty.txt: for testing when an empty file is entered
        - IDTest.txt: for testing when an ID is not an integer
        - ISBNTest.txt: for testing when an ISBN is not an integer
        - MissingFieldTest.txt: for testing when a book field is missing


to compile:
    g++ -c Book.cpp program.cpp
    g++ -o program Book.o program.o

to run: 
    ./program
    Enter the name of a file containing book information, i.e. "BookInfo.txt"
    OR test incorrectly formatted text files. e.g.  enter "Tests/Empty,txt"
