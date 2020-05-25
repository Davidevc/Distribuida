with Ada.Text_IO; use Ada.Text_IO;

procedure Tarea is
   type T3  is digits 3;
   type T15 is digits 15;
   type T18 is digits 18;
   D : Float := 2.5;

   type T_Norm  is new Float range -1.0 .. 1.0;
   E  : T_Norm;

   procedure usoFlotante is
      C1 : constant := 1.0e-4;
      A : T3  := 1.0 + C1;
      B : T18 := 1.0 + C1;
   begin
   Put_Line ("The value of A is " & T3'Image (A));
   Put_Line ("The value of B is " & T18'Image (B));
   end usoFlotante;


begin
   Put_Line ("T3  requires " & Integer'Image (T3'Size) & " bits");
   Put_Line ("T15 requires " & Integer'Image (T15'Size) & " bits");
   Put_Line ("T18 requires " & Integer'Image (T18'Size) & " bits");

   D := abs (D - 4.5);
   Put_Line ("The value of D is " & Float'Image (D));
   D := D ** 2 + 1.0;
   Put_Line ("The value of D is " & Float'Image (D));

   usoFlotante;

   E := 1.0;
   Put_Line ("The value of E is " & T_Norm'Image (E));
end Tarea;
