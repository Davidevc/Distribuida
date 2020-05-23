with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Increment_By;

procedure Tarea is
function Img (I : Integer) return String renames Integer'Image;

begin
   Put_Line (Img (2));
   Put_Line (Img (3));
end Tarea;
