with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Increment_By;

procedure Tarea is
   procedure Swap (A, B : in out Integer) is --NECESARIO PARA USAR VARIABLES PASADAS POR PROCEDIMIENTO
      -- IN OUT PERMITE EL ACCESO DE LECTURA Y ESCRITURA DEL OBJETO PASADO COMO PARAMETRO.
      Tmp : Integer;
   begin
      Tmp := A;
      A := B;
      B := Tmp;
   end Swap;

   A : Integer := 12;
   B : Integer := 44;
begin
    Swap (A, B);
    Put_Line (Integer'Image (A)); --  Prints 44
end Tarea;
