with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Tarea is

function Increment (I : Integer) return Integer;

function Increment (I : Integer) return Integer is
begin
    return I + 1;
end Increment;


begin
Put(Integer'Image(Increment(5)));
end Tarea;
