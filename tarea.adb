with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Increment_By;

procedure Tarea is

A, B, C, D : Integer;
begin
   C := Increment_By;

   Put_Line ("Using defaults for Increment_By is "
             & Integer'Image (C));

   A := 10;
   B := 3;
   D := 10;
   C := Increment_By (A, B, D);
   --                 ^ Regular parameter passing

   Put_Line ("Increment of " & Integer'Image (A)
             & " with "      & Integer'Image (B)
             & " multiple "  & Integer'Image (D)
             & " is "        & Integer'Image (C));

   A := 20;
   B := 5;
   D := 10;
   C := Increment_By (I    => A,
                      Incr => B,
                      multp => D);
    --                ^ Named parameter passing

   Put_Line ("Increment of " & Integer'Image (A)
             & " with "      & Integer'Image (B)
             & " multiple "  & Integer'Image (D)
             & " is "        & Integer'Image (C));
end Tarea;
