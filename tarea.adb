with Ada.Text_IO; use Ada.Text_IO;
--STRONG TYPING
procedure Tarea is
    type Meters is new Float;
   type Miles is new Float;

   --  Function declaration, like procedure but returns a value.
   function To_Miles (M : Meters) return Miles is
   --                             ^ Return type
   begin
      return (Miles (M) * 1609.0) / 1000.0;
      --         ^ Type conversion, from Meters to Miles
   --  Now the code is correct
   end To_Miles;

   Dist_Imperial : Miles;
   Dist_Metric   : constant Meters := 100.0;
begin
   Dist_Imperial := To_Miles (Dist_Metric);
   --ADA rechaza procedimientos en los cuales se mezclen variables. (FUERTEMENTE TIPADA)
   Put_Line (Miles'Image (Dist_Imperial));
end Tarea;
