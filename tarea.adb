with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Increment_By;

procedure Tarea is

   A, B, C, D : Integer;

   procedure Display_Result is
   begin
      Put_Line ("Increment of " & Integer'Image (A)
                & " with "      & Integer'Image (B)
                & " multiple "  & Integer'Image (D)
                & " is "        & Integer'Image (C));
   end Display_Result;


begin
   A := 10;
   B := 3;
   D := 10;
   C := Increment_By (A, B, D);
   Display_Result;
end Tarea;
