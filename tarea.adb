with Ada.Text_IO; use Ada.Text_IO;

procedure Tarea is
 --  Declara un tipo entero con signo y da los limites
   type My_Int is range -1 .. 20;--Cada declaraci�n de tipo en Ada comienza con la typepalabra clave
     				 --(excepto los tipos de tarea ).
   --                         ^ limite alto
   --                   ^ limite bajo

   --  al igual que las variables, las declaraciones de tipo solo pueden aparecer en
   --  regiones declarativas
begin
   for I in My_Int loop --desde I (inicio) hasta todo el rango de la varialbe My_Int
      Put_Line (My_Int'Image (I));
      --              ^ 'Image attribute, converts a value to a
      --                 String
   end loop;
end Tarea;

--En Ada, un tipo entero no se especifica en t�rminos de su representaci�n de m�quina,
--sino m�s bien por su rango. El compilador elegir� la representaci�n m�s adecuada.
