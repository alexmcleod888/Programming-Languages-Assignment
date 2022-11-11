#include <iostream>
#include <regex>
#include <fstream>
#include <stdio.h>
#include <sstream>
#include "Book.h"

// purpose: swaps two elements
void swap(Book* a, Book* b) 
{ 
    Book t = *a; 
    *a = *b; 
    *b = t; 
} 

// reference: C++ Program for QuickSort. (2014, January 7). GeeksforGeeks. https://www.geeksforgeeks.org/cpp-program-for-quicksort/
/* purpose: This function makes the right most element at the index 'lastIndex' the pivot
 * It then sorts the elements so that everything less then the pivot is on its
 * left and everything greater then the pivot is on the right                    */
int partition (Book arr[], int firstIndex, int lastIndex) 
{ 
    Book pivot = arr[lastIndex];//set the pivot
    int i = (firstIndex - 1);  // Index of smaller element 
  
    for (int j = firstIndex; j <= lastIndex - 1; j++) 
    { 
        // If current element j is smaller than or equal ot pivot perform a swap with 
	// i++ element
        if (arr[j].GetBookID() <= pivot.GetBookID()) 
        { 
            i++;    // increment index of smaller element 
            swap(&arr[i], &arr[j]); 
        } 
    } 
    //swap pivot so everything on the left is less then it and everything on the right is greater
    swap(&arr[i + 1], &arr[lastIndex]); 
    return (i + 1); 
} 

// reference: C++ Program for QuickSort. (2014, January 7). GeeksforGeeks. https://www.geeksforgeeks.org/cpp-program-for-quicksort/
/* purpose: The function that implements QuickSort
   arr[]: array of books to be sorted,
   firstIndex: Starting index,
   lastIndex: Ending index */
void quickSort(Book arr[], int firstIndex, int lastIndex) 
{ 
    //once all elements have been sorted stop recursing
    if (firstIndex < lastIndex) 
    { 
        // sets the index partioning two sections
        int pi = partition(arr, firstIndex, lastIndex); 
  
        // sorts elements before partition
        quickSort(arr, firstIndex, pi - 1); 
	// sorts elements after the partition
        quickSort(arr, pi + 1, lastIndex); 
    } 
} 

//purpose: prints out book information, from an array of Book objects
void printElements(Book arr[], int length)
{
    int i;
    std::cout << "Books sorted using quicksort based on ID:\n";
    //for each book prints out its information, starting fromt he first index of the array
    for (i = 0; i < length; i++)
    {
        std::cout << "book ID: " + std::to_string(arr[i].GetBookID()) << std::endl;
        std::cout << "book Name: " + arr[i].GetBookName() << std::endl;
        std::cout << "book ISBN: " + arr[i].GetISBN() << std::endl;	 
        std::cout << "\n";	
    }
}

//purpose: this is where the program starts and the file is input by the user
int main()
{ 
    Book * arr;
    int numBooks;
    std::string line;
    std::string filename;
    bool error;

    error = false;	
    //do while used so that if a user enters an incorrect file they can try again
    do
    {	    
	//try block used to throw any errors that occur when trying to open or read the file
        try
        {	    
            error = false;
	    std::cout << "Type the name of the text file containing book information: ";
	    std::cin >> filename; //user input filename is assigned to string
            numBooks = 0;
            std::ifstream myfile (filename);

	    //regex used to check the format of the input file is correct
            std::regex formatChecker("^[0-9]+,[A-Za-z0-9\\s]+,[0-9]+$");

	    //try opening the file is it exists
            if (myfile.is_open())
            {
                //retrieve each line
                while(getline(myfile, line))
                {
                    numBooks += 1;//count the number of books in the file
		    if(!std::regex_match(line, formatChecker))//of incorrectly formatted throw 
			                                      //error message
                    {
			myfile.close();   
                        throw "Error: input file is incorrectly formatted";
	            }		
                }

		//if no books are found throw an error message
                if(numBooks == 0)
	        {
	            throw "Error: the file is empty";
                }                
                myfile.close();
            }
            else//if file could not be opened then throw and error message
            {
                throw "Error: file could not be opened";
            }
        }
        catch(const char* errorMsg)//catch any error messages that occur and display them to user
        {
            std::cerr << errorMsg << std::endl;
            error = true;//set error to true so that the loop is repeated
        }
	catch(...)//catch any other errors that might occur
        {
	    std::cerr << "Error: something when wrong when opening the file" << std::endl;
	}    
    }
    while(error == true);    


    arr = new Book [numBooks];
    std::ifstream myfile2 (filename);
    //open the file again to extract book information
    if (myfile2.is_open())
    {
        int i = 0;
        while(getline(myfile2, line))//go line by line to get book information
        {
            std::stringstream s_stream(line);

            std::string substr;
            getline(s_stream, substr, ','); //get first string delimited by comma
            arr[i].SetBookID(std::stoi(substr));

            getline(s_stream, substr, ',');//get next string after first comma
            arr[i].SetBookName(substr);

            getline(s_stream, substr, ',');//get next string after second comma
            arr[i].SetBookISBN(substr);

            i += 1;

        }
        myfile2.close();
    }

    quickSort(arr, 0, numBooks - 1);//sort the array of books using quicksort
    printElements(arr, numBooks);//output the sorted books to console

    delete[] arr;
    return 0;
}
