with Ada.Text_Io, Ada.Integer_Text_IO;
use Ada.Text_Io, Ada.Integer_Text_IO;
with TipoSemaforos;

--EJEMPLO SEMAFORO
procedure Tarea is
package Paquete_Semaforos is new TipoSemaforos;
  use Paquete_Semaforos;
  completoListo : TSemaforo;

  task Cocinero;
  task Comedor;

  task body Cocinero is
   begin
      delay(5.0);
      for i in 1..5 loop
         put("** voy a preparar un completo");New_Line;
         delay(3.0);
         Put("** prepare un completo");New_Line;
         Signal(completoListo);
      end loop;

  end Cocinero;

  task body Comedor is
   begin
      delay(1.0);
      for i in 1..5 loop
         Put("$$ espero por un completo"); New_Line;
         Wait(completoListo);
         Put("$$ tengo el completo en la mano");New_Line;
         delay(2.0);
         Put("$$ me lo comi");New_Line;
    end loop;
  end Comedor;

begin
   Wait(completoListo);
   put("solo baje el contador a 0");New_Line;
end Tarea;
