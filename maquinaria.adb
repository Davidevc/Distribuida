with Ada.Text_IO;           use Ada.Text_IO;
with TipoSemaforos;

package body Maquinaria is
package Paquete_Semaforos is new TipoSemaforos;
   use Paquete_Semaforos;
 
   procedure armarBicicleta is
      task Maquina_Sillin;
      task Maquina_Marco;
      task Maquina_Ruedas;
      task Maquina_Canastito;
      task Maquina_Frenos;
      task Maquina_Pedales;
      
      --************************* MAQUINA SILLIN *******************************
      task body Maquina_Sillin is
      begin
         Put_Line("MAQUINA SILLIN: Comienzo sillin");
         delay(4.0);
         Put_Line("MAQUINA SILLIN: Sillin listo");
      end Maquina_Sillin;
      --************************* MAQUINA SILLIN *******************************
      
      --************************* MAQUINA MARCO *******************************
      task body Maquina_Marco is
         SemaforoFunde : TSemaforo;
         MarcoListo : TSemaforo;
      
         Task Funde;
         Task Pinta;
   
         task body Funde is
         begin
            Put_Line("MAQUINA FUNDIDORA: Comienzo a fundir");
            delay(7.0);
            Put_Line("MAQUINA FUNDIDORA: Fundido listo");
            Signal(SemaforoFunde);
         end Funde;
   
         task body Pinta is
         begin
            Wait(MarcoListo);
            Put_Line("MAQUINA PINTADO: Espero para pintar");
            Wait(SemaforoFunde);
            Put_Line("MAQUINA PINTADO: Puedo pintar y pinto");
            delay(4.0);
            Put_Line("MAQUINA PINTADO: Pintado listo");
            Signal(MarcoListo);
         end Pinta;
      
      begin
         Wait(SemaforoFunde);
         Wait(MarcoListo);
         Put_Line("MAQUINA MARCO: Marco listo");
      end Maquina_Marco;
      --************************* MAQUINA MARCO *******************************
      
      --************************* MAQUINA RUEDA *******************************
      task body Maquina_Ruedas is
         SemaforoRayos : TSemaforo;
         RuedaLista : TSemaforo;
         
         Task ArmaRayos;
         
         task body ArmaRayos is
         begin
            for i in 1..2 loop
               Wait(RuedaLista);
               for i in 1..20 loop
                  delay(0.2);
                  Put_Line("MAQUINA RAYOS: Rayo" & Integer'Image(i) & " listo");               
               end loop;  
               Signal(SemaforoRayos);
            end loop;
         end ArmaRayos;
         
      begin         
         Wait(SemaforoRayos);
         for i in 1..2 loop
            Wait(SemaforoRayos);
            Put_Line("MAQUINA RUEDA: Rueda" & Integer'Image(i) & " lista");
            Signal(RuedaLista);
         end loop;
      end Maquina_Ruedas;
      --************************* MAQUINA RUEDA *******************************
      
      --************************* MAQUINA CANASTITO ****************************
      task body Maquina_Canastito is         
      begin
         Put_Line("MAQUINA CANASTITO: Comienzo el canastito");
         delay(7.0);
         Put_Line("MAQUINA CANASTITO: Canastito listo");
      end Maquina_Canastito;
      --************************* MAQUINA CANASTITO ****************************
      
      --************************* MAQUINA FRENOS *******************************
      task body Maquina_Frenos is
      begin
         Put_Line("MAQUINA FRENOS: Comienzo los frenos");
         delay(3.0);
         Put_Line("MAQUINA FRENOS: Frenos listos");
      end Maquina_Frenos;
      --************************* MAQUINA FRENOS *******************************

      --************************* MAQUINA PEDALES ******************************
      task body Maquina_Pedales is 
      begin
         Put_Line("MAQUINA PEDALES: Comienzo los pedales");
         delay(10.0);
         Put_Line("MAQUINA PEDALES: Pedales listos");
      end Maquina_Pedales;
      --************************* MAQUINA PEDALES ******************************
      
   begin
      null;  
   end armarBicicleta;
      
end Maquinaria;
