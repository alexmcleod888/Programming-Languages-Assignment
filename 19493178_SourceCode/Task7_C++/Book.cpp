#include <string>
#include <cstdlib>
#include <iostream>

#include "Book.h"

Book::Book()
{
    bookID = 0;
    bookName = "default book";
    ISBN =  "0";
} 

int Book::GetBookID()
{
    return bookID;
}

std::string Book::GetBookName()
{
    return bookName;
}

std::string Book::GetISBN()
{
    return ISBN;
}

void Book::SetBookID(int newID)
{
    bookID = newID;
}

void Book::SetBookName(std::string newName)
{
    bookName = newName;
}

void Book::SetBookISBN(std::string newISBN)
{
    ISBN = newISBN;
}
    	
Book::~Book()
{
    
}    
    
