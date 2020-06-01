with Ada.Text_Io, Ada.Integer_Text_IO;
use Ada.Text_Io, Ada.Integer_Text_IO;
with TipoSemaforos;
with Maquinaria;

--EJEMPLO SEMAFORO
procedure Tarea is
package Paquete_Semaforos is new TipoSemaforos;
   use Paquete_Semaforos;
   use Maquinaria;
   Semaforo1 : TSemaforo;
   task Armador_Bicicleta;

   task body Armador_Bicicleta is

   begin
      armarBicicleta;
      Put_Line("Tengo Todas las piezas, la arme");
  end Armador_Bicicleta;


begin
   null;
end Tarea;
