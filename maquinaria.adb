with Ada.Text_IO;           use Ada.Text_IO;
with TipoSemaforos;

package body Maquinaria is
package Paquete_Semaforos is new TipoSemaforos;
   use Paquete_Semaforos;
 
   procedure armarBicicleta is
      task Maquina_Sillin;
      task Maquina_Marco;
      
      task body Maquina_Sillin is
      begin
         delay(4.0);
         Put_Line("Sillin Listo");
      end Maquina_Sillin;
   
      task body Maquina_Marco is
         SemaforoFunde : TSemaforo;
         MarcoListo : TSemaforo;
      
         Task Funde;
         Task Pinta;
   
         task body Funde is
         begin
            Put_Line("Comienzo a fundir");
            delay(2.0);
            Put_Line("Fundido Listo");
            Signal(SemaforoFunde);
         end Funde;
   
         task body Pinta is
         begin
            Wait(MarcoListo);
            Put_Line("Espero para pintar");
            Wait(SemaforoFunde);
            Put_Line("Puedo pintar y pinto");
            delay(2.0);
            Put_Line("Pintado Listo");
            Signal(MarcoListo);
         end Pinta;
      
      begin
         Wait(SemaforoFunde);
         Wait(MarcoListo);
         Put_Line("Marco listo");
      end Maquina_Marco;
      
   begin
      null;  
   end armarBicicleta;
      
end Maquinaria;
