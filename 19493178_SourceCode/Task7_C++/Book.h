#pragma once

class Book
{
private:
    int bookID;
    std::string bookName;
    std::string ISBN;
public:
    int GetBookID();
    std::string GetBookName();
    std::string GetISBN();

    void SetBookID(int);
    void SetBookName(std::string);
    void SetBookISBN(std::string);

    Book();
    ~Book();
};
