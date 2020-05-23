with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Increment_By;

procedure Tarea is
    procedure Compute_A (V : Natural);
    --  Forward declaration of Compute_A

    procedure Compute_B (V : Natural) is
    begin
      if V > 5 then
         Put(V);
          Compute_A (V - 1);
         --  Call to Compute_A
       end if;
    end Compute_B;

    procedure Compute_A (V : Natural) is
    begin
      if V > 2 then
         Put(V);
         Compute_B (V - 1);
          --  Call to Compute_B
       end if;
    end Compute_A;
begin
   Compute_A (15);
end Tarea;
