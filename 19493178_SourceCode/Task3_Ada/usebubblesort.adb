with sort_package;
with Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;

-- types taken from sort_package to declare and array and 
-- loop through its length
use type sort_package.Int_Array;
use type sort_package.Length;

-- purpose: procedure for allowing IO where user can enter numbers and they are displayed
--          in increasing order
procedure useBubbleSort is
    -- rename the TEXT_IO package to IO for ease of user
    package IO renames Ada.Text_IO;
    
    -- declare the integer array for storing values
    Arr : sort_package.Int_Array := (0, 0, 0, 0, 0);
    -- indicates whether an error is present
    error : Boolean;

    begin
        IO.Put_Line("Enter 5 numbers to sort");

        -- loop from 0 to 4 to get the integer from user input for the array
        for I in sort_package.Length range 0 .. 4 loop
        Until_Loop1 :
            -- while loop, that keep loop when input is incorrect
            loop
	        begin 	 
		    error := false; -- false when no error
	            IO.Put_Line("Enter integer: ");
                    Arr(I) := Integer'Value (IO.Get_Line);
                exception --catch exceptions with user input
                    when Constraint_Error => 
	            IO.new_Line (1);
	            IO.Put_Line ("Error: input must be an integer data type");
	            IO.Put_Line ("       and the input length must be from -999999999 to 9999999999");
		    IO.Put_Line ("You must re-enter the number");
                    error := true;
                end;
	        exit Until_Loop1 when error = false; -- only exit the loop when there hasnt been an error 
	    end loop Until_Loop1;
        end loop;

        -- input the array into the bubble sort function to sort the array in ascending order
        Sort_package.bubbleSort (Arr);
 
        -- output the resulting array
        IO.New_Line(1);
        IO.Put_Line("Numbers in ascending order:");
        for I in sort_package.Length loop
            IO.Put_Line(INTEGER'Image (Arr(I)));
        end loop;
    end useBubbleSort;
        
