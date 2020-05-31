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


  task Arma_Bicicleta;

   task body Arma_Bicicleta is
      Sillin : Boolean;
      Marco : Boolean;
   begin
      Sillin := Maquina_Sillin;
      Marco := Maquina_Marco;
  end Arma_Bicicleta;


begin
   null;
end Tarea;
