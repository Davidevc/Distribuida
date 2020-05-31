with Ada.Text_IO;           use Ada.Text_IO;
with TipoSemaforos;

package body Maquinaria is
package Paquete_Semaforos is new TipoSemaforos;
   use Paquete_Semaforos;
 
   function Maquina_Sillin return Boolean is
   begin
      delay(5.0);
      Put_Line("Sillin Listo");
      return True;
   end Maquina_Sillin;
   
   function Maquina_Marco return Boolean is
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
      return True;
   end Maquina_Marco;
     
   function Maquina_Ruedas return Boolean is
   begin
      delay(5.0);
      Put_Line("Ruedas Listo");
      return True;
   end Maquina_Ruedas;
     
   function Maquina_Canastito return Boolean is
   begin
      delay(5.0);
      Put_Line("Canastito Listo");
      return True;
   end Maquina_Canastito;
     
   function Maquina_Frenos return Boolean is
   begin
      delay(5.0);
      Put_Line("Frenos Listo");
      return True;
   end Maquina_Frenos;
     
   function Maquina_Pedales return Boolean is
   begin
      delay(5.0);
      Put_Line("Pedales Listo");
      return True;
   end Maquina_Pedales;


end Maquinaria;
