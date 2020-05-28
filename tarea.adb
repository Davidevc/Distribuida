with Ada.Text_Io, Ada.Integer_Text_IO;
use Ada.Text_Io, Ada.Integer_Text_IO;
with TipoSemaforos;

--EJEMPLO SEMAFORO
procedure Tarea is
package Paquete_Semaforos is new TipoSemaforos;
  use Paquete_Semaforos;
  miSemaforo : TSemaforo;

  task Tarea1;
  task Tarea2;

  VariableComun: Integer := 0;

  task body Tarea1 is
       tmpT1 : Integer := 100;
       tmp : Integer;
  begin
    for i in 1..10 loop
	Wait(miSemaforo);
	 Put("{");
	 tmp := VariableComun;
         tmp := tmp+tmpT1;
	 delay(0.1);
	 VariableComun := tmp;
	 Put("}");
	Signal(miSemaforo);

	for k in 1 .. 5 loop
		put_line("mi mama me mima");
	end loop;

    end loop;
  end Tarea1;

  task body Tarea2 is
       tmpT2 : Integer := 1000;
       tmp : Integer;
  begin
    for i in 1..10 loop
	Wait(miSemaforo);
	   Put("[");
	   tmp := VariableComun;
           tmp := tmp+tmpT2;
	   delay(0.1);
	   VariableComun := tmp;
	   Put("]");
	Signal(miSemaforo);

	for k in 1 .. 5 loop
		put_line("2+2=4");
	end loop;

    end loop;


  end Tarea2;

begin
     for i in 1..10 loop
	Wait(miSemaforo);
           Put("<");
           Put(VariableComun);
           Put(">");
	Signal(miSemaforo);
     end loop;
	Delay(3.0);
        Put(VariableComun);
end Tarea;
