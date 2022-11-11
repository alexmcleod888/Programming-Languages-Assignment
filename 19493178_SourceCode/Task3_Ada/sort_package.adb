with Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;

-- purpose: package holding sorting algorithm
package body Sort_Package is

    -- function that takes in an integer array and sorts it in ascending order
    -- using bubble sort
    procedure bubbleSort (Arr : in out Int_Array) is
    Swapped : Boolean;
    begin
        -- until loop that ends when no swaps occur        
        Until_Loop2:
        loop
            Swapped := false;
            -- compare each value that is next to each other in the array
            -- if the right value is high then the left then swap them
            -- otherwise continue to the next to values
            -- only stop going through the array when no stops have occured 
            -- on one pass
            for I in Length range 1 .. 4 loop
                if(Arr(I-1) > Arr(I)) then
                    swap(Arr(I), Arr(I - 1));
                    Swapped := true;
                end if;
            end loop;
            exit Until_Loop2 when (Swapped = false);
        end loop Until_Loop2;
    end BubbleSort;
    
    procedure swap (value1: in out Integer; value2: in out Integer) is
    Temp : Integer;    
    begin
        Temp := value1;
        value1 := value2;
        value2 := Temp;
    end swap;
end Sort_Package;

