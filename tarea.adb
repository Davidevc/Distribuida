with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Week;

procedure Tarea is
   use Week;
   --  Make every entity of the Week package directly visible.
begin
   Put_Line ("First day of the week is " & Mon);
end Tarea;
