with Ada.Text_IO;

procedure Tarea is
   package TIO renames Ada.Text_IO;
   procedure Say (Something : String) renames Ada.Text_IO.Put_Line;
begin
   TIO.Put_Line ("Hello");
   Say ("Hello con solo Say");
end Tarea;
