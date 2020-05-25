with Ada.Text_IO; use Ada.Text_IO;

procedure Tarea is
 type Days is (Monday, Tuesday, Wednesday,
                 Thursday, Friday, Saturday, Sunday);
   --  An enumeration type
begin
   for I in Days loop
      case I is
         when Saturday .. Sunday =>
            Put_Line ("Week end!");

         when Monday .. Friday =>
            Put_Line ("Hello on " & Days'Image (I));
            --  'Image attribute, works on enums too
      end case;
   end loop;
end Tarea;
