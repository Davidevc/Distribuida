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
   Semaforo2 : TSemaforo;

   task Operador_Armador_Bicicleta;
   task Operador_Limpia;
   task Operador_embalaje;

   task body Operador_Armador_Bicicleta is
   begin
      Wait(Semaforo2);
      Put_Line("OPERARIO ARMADO: Enciendo las maquinas para la bicicleta");
      delay(0.4);
      armarBicicleta;
      Put_Line("OPERARIO ARMADO: Tengo Todas las piezas, la arme");
      Put_Line("OPERARIO ARMADO: Bicicleta armada se la delego a el limpiador");
      Signal(Semaforo1);
   end Operador_Armador_Bicicleta;

   task body Operador_Limpia is
   begin
      delay(0.2);
      Put_Line("OPERARIO LIMPIADOR: Espero la bicicleta terminada para empezas a limpiar");
      Wait(Semaforo1);
      Put_Line("OPERARIO LIMPIADOR: Tengo la bicicleta en mis manos y la estoy limpiando");
      delay(5.0);
      Put_Line("OPERARIO LIMPIADOR: Termine de limpiarla y se la delego al operario de embalaje");
      Signal(Semaforo1);
   end Operador_Limpia;

   task body Operador_embalaje is
   begin
      delay(0.3);
      Put_Line("OPERARIO EMBALAJE: Espero la bicicleta limpiada para empezas a embalar");
      Wait(Semaforo1);
      Put_Line("OPERARIO EMBALAJE: Tengo la bicicleta en mis manos y la estoy embalando");
      delay(2.0);
      Put_Line("OPERARIO EMBALAJE: Termine el embalaje");
      Signal(Semaforo2);
  end Operador_embalaje;


begin
   Wait(Semaforo1);
   delay(0.2);
   Wait(Semaforo2);
   Put_Line("*************************** BICICLETA LISTA ***************************");
end Tarea;
