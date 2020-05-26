with Ada.Text_IO; use Ada.Text_IO;
--Component selection
procedure Tarea is

    type Month_Type is
     (January, February, March, April, May, June, July,
      August, September, October, November, December);

   type Date is record
      Day   : Integer range 1 .. 31;
      Month : Month_Type;
      Year  : Integer range 1 .. 3000 := 2032;
   end record;

   Some_Day : Date := (Day => 1, Month => January,Year => 2000);

begin
   Some_Day.Year := 2001;
   Put_Line ("Day:" & Integer'Image (Some_Day.Day)
             & ", Month: " & Month_Type'Image (Some_Day.Month)
             & ", Year:" & Integer'Image (Some_Day.Year));

end Tarea;
