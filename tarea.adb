with Ada.Text_IO; use Ada.Text_IO;
--TIPOS DERIVADOS
procedure Tarea is
   type Days is (Monday, Tuesday, Wednesday, Thursday,
                 Friday, Saturday, Sunday);

   type Weekend_Days is new Days range Saturday .. Sunday;
   --  New type, where only Saturday and Sunday are valid literals.

   subtype Weekend_Days2 is Days range Saturday .. Sunday;
   --                           ^ Constraint of the subtype

   M : Days := Sunday;

   S : Weekend_Days2 := M; -- s variable, weekend_days2 tipo de variable, su valor "m= sunday" si pernece al sub tipo.
   --  No error here, Days and Weekend_Days are of the same type.
begin
   for I in Days loop
      Put_Line (Days'Image (I));
   end loop;

   for I in Weekend_Days loop
      Put_Line (Weekend_Days'Image (I));
   end loop;

   for I in Days loop
      case I is
         --  Just like a type, a subtype can be used as a
         --  range
         when Weekend_Days2 =>
            Put_Line ("Week end!");
         when others =>
            Put_Line ("Hello on " & Days'Image (I));
      end case;
   end loop;

end Tarea;
