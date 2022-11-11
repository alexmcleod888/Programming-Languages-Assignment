%{

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <stdbool.h>
void yyerror (char * str);
int yylex();
int length();
void printList();
void bubbleSort();
void insertFirst(int key, int data);

//purpose: node for linked list
struct node {
    int integerVal;
    int countNum;
    struct node *next;
};

//purpose: pointers to the head of the linked list and the current node
struct node *head = NULL;
struct node *current = NULL;
int count = 0;


%}


%union {int num;}
%token OPENBRACKET
%token CLOSEBRACKET
%token COMMA
%token <num> NUMBER
%type <num> integer


%%
list: 
	OPENBRACKET integer_list CLOSEBRACKET
        {
                bubbleSort();
                printList();
                return 0;
        }
        ;

integer_list:
	integer      
	| integer COMMA integer_list 		
        ;
integer:
     	NUMBER 
        { 
		printf("number: %d\n", $1); 
		$$ = $1;
               insertFirst(count, $1);
               count = count + 1; 
              
        }
        ;			
        
%%

void yyerror(char * str)
{
        fprintf(stderr, "error: %s\n", str);
}

int yywrap()
{
        return 1;
}

//purpose: inserting a new element to the linked list
void insertFirst(int newCountNum, int newIntegerVal)
{
    struct node *link = (struct node*) malloc(sizeof(struct node));

    link->countNum = newCountNum;
    link->integerVal = newIntegerVal;

    link->next = head;

    head = link;
}

//purpose: gets the length of the linked list
int length() {
   int length = 0;
   struct node *current;

   for(current = head; current != NULL; current = current->next) {
      length++;
   }

   return length;
}

//prints outs everything in the list as well as free the allocated memory
void printList() {
   struct node *ptr = head;
   printf("\n[ ");

   //start from the beginning
   while(ptr != NULL) {
      printf("%d ", ptr->integerVal);
      ptr = ptr->next;
   }
   
   //free allocated memory of each node of the list
   ptr = head;
   while(ptr != NULL) {
      struct node *nd = ptr;
      ptr = ptr->next;
      free(nd);
   }

   printf("]\n");
}

//purpose: sorts the numbers within the linked list using bubble sort
void bubbleSort() 
{
   int i, j, k, tempNum, tempInteger;
   struct node *current;
   struct node *next;

   int n = length();
 
    for (i = 0; i < n; i++)  
    {     
        //start from the beginning of the list
        current = head;
        next = head->next;
        //as the list sorts reduce by one how many numbers must be sorted
        for (j = 0; j < n-i-1; j++)
        {  
            if (current->integerVal > next->integerVal) 
            {
                //swap the integer value of the two nodes
                tempInteger = current->integerVal;
                current->integerVal = next->integerVal;
                next->integerVal = tempInteger;

                //swap the count id of each node
                tempNum = current->countNum;
                current->countNum = next->countNum;
                next->countNum = tempNum; 
            }
            current = current->next;
            next = next->next;
        }
        
    }                           
} 


int main()
{
        return yyparse();
}
