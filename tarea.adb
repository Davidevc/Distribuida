with Ada.Text_IO; use Ada.Text_IO;
--Component selection
procedure Tarea is
   type My_Int is range 0 .. 1000;
   type Index is range 1 .. 5;
   type My_Int_Array is array (Index) of My_Int;
   --                                    ^ Type of elements
   --                          ^ Bounds of the array
   Arr : My_Int_Array := (2, 3, 5, 7, 11);
   --                    ^ Array literal, called aggregate in Ada


begin
   for I in Index loop
      Put (My_Int'Image (Arr (I)));
      --                     ^ Take the Ith element
   end loop;
   New_Line;

end Tarea;
