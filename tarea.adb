with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;


procedure Tarea is

   cantidad_de_sillas : Integer := 2; --Sillas disponbles en la consulta
   estado_del_dentista : Integer := 1; --SE�AL [1] esta despierto
   atiende_dentista : Integer := 0; --SE�AL [0] esta en cierto
   atiende_paciente : Integer := 1; --SE�AL [1] esta en CIERTO
   turno : Integer := 1;
   estado : Boolean;

   task type Dentista(b: natural);
   task type pacientes(e: natural);

   -- ********************************DENTISTA**************************************
    task body Dentista is

   begin

      while (atiende_paciente/=0)loop
         null;
      end loop;

         if(turno = 1)then
            atiende_dentista := 1;
         while(turno = 1) loop
            null;
            end loop;
               Put_Line("atendiendo");
               delay(1.0);
               atiende_dentista := 0;
         end if;

         estado := True;

         turno := 1;
         atiende_dentista := 1;

   end Dentista;

   -- ********************************PACIENTE**************************************
   task body pacientes is

      type Rand_Range is range 2..5; -- hay que cambiarlo a 30..45
      package Rand_Int is new Ada.Numerics.Discrete_Random(Rand_Range);
      seed : Rand_Int.Generator;
      Num : Rand_Range;
      voy_a_esperar : Integer;
      me_atendieron : Boolean := False;
      tmp : Integer := 0;

   begin
      Rand_Int.Reset(seed);
      Num := Rand_Int.Random(seed);
      voy_a_esperar := Integer'Value (Rand_Range'Image(Num));

      while (me_atendieron = False) loop
         delay(1.0);

         if (voy_a_esperar = 0) then

            Put_Line("me voy");
            exit;
            --cantidad_de_sillas := 1;

         elsif (cantidad_de_sillas > 0) then

            Put("Paciente");Put(e);Put(" : ");Put("me sentare y esperare mi turno");
            New_Line;

            -- SECCION CRITIRA
            tmp :=  cantidad_de_sillas;
            tmp :=  tmp - 1;
            cantidad_de_sillas := tmp;
            -- SECCION CRITICA

            while (atiende_dentista/=0) loop
            null;
            end loop;

               if(turno=0)then
                  atiende_paciente := 0;
               while(turno=0) loop
                  null;
                  end loop;
                     Put_Line("atendidoooooooo");
                     delay(1.0);
                     atiende_paciente := 1;

               end if;

               me_atendieron := estado;
               Put("Paciente");Put(e);Put(" : ");Put("me atendieron, adios");
               New_Line;

               turno := 0;
               atiende_paciente := 0;


            exit;

         elsif (cantidad_de_sillas = 0) then

            voy_a_esperar := voy_a_esperar -1;
            Put("Paciente");Put(e);Put(" : ");Put(voy_a_esperar); --  SOLO PARA SABER EL TIEMPO DE ESPERA, LUEGO ELIMINAR
            New_Line;--  SOLO PARA SABER EL TIEMPO DE ESPERA, LUEGO ELIMINAR

         end if;
      end loop;



   end pacientes;



-- ********************************DECLARACION DE OBJETOS**************************************

   type elDentista is access Dentista;
   type losPacientes is access pacientes;

   DentistaAtiende : elDentista;
   pacienteAtendido: losPacientes;

-- ********************************PROGRAMA INICIO**************************************
begin


   for i in 1..3 loop
   delay(0.3);
      pacienteAtendido := new pacientes(i);
      DentistaAtiende := new Dentista(i);
   end loop;

end Tarea;
