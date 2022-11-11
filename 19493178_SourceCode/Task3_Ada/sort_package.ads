with Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;

-- packagae containing the sorting algorithm
package Sort_Package is

   -- types used for array that is sorted
   type Length is range 0 .. 4;
   type Int_Array is array (Length) of Integer;

   -- bubble sorter function
   procedure bubbleSort (Arr : in out Int_Array);
   
   -- swap procedure
   procedure swap (value1 : in out Integer; value2 : in out Integer);

end Sort_Package;

