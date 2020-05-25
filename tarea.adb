with Ada.Text_IO; use Ada.Text_IO;

procedure Tarea is
   type My_Int is range 1 .. 20;
   A : My_Int := 12;
   B : My_Int := 15; --no son definibles con valores sobre 20 o menores que 1
   M : My_Int := (A + B) / 2;
   --  No overflow here, overflow checks are done at
   --  specific boundaries.
begin
   for I in 1 .. M loop
      Put_Line ("Hello, World!");
   end loop;
   --  Loop body executed 13 times
end Tarea;
