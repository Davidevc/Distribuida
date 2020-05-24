with Ada.Text_IO;           use Ada.Text_IO;
package body Week.Child.Grandchild is

   function Get_Second_Of_Week return String is
   begin
      Put_Line ("First day of the week is " & Get_First_Of_Week);
      return Tue;
   end Get_Second_Of_Week;

end Week.Child.Grandchild;
