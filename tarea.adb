with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;


procedure Tarea is

   cantidad_de_sillas : Integer := 4; --Sillas disponbles en la consulta
   estado_del_dentista : Integer := 0; --SEÑAL [1] 0 esta dormido ,1 esta despierto
   atiende_dentista : Boolean := True; --SEÑAL [0] esta en cierto
   atiende_paciente : Boolean := True; --SEÑAL [1] esta en CIERTO
   turno : Integer := 0;
   estado : Boolean := False;
   turno_paciente : Integer := 1;

   task type Dentista(b: natural);
   task type pacientes(e: natural);

   -- ********************************DENTISTA**************************************
    task body Dentista is

   begin

      Put("Soy el dentista estoy atendiendo");
      New_Line;

      while (b /= turno_paciente) loop

      while (atiende_paciente=True)loop

         atiende_dentista := False;

         while(turno /= 0) loop
            null;
            end loop;

      atiende_dentista := True;
      end loop;

      -- SECCION CRITICA
      Put("Dentista : Que pase el Siguiente");
      New_Line;
      estado := True;
      delay(1.0);
      -- SECCION CRITICA

      turno := 1;
      atiende_dentista := False;

      end loop;

      Put_Line("Dentista: me dormi");

   end Dentista;

   -- ********************************PACIENTE**************************************
   task body pacientes is

      type Rand_Range is range 30..45; -- entre 30 y 45 segundos simulando minutos como se estima en la actividad
      package Rand_Int is new Ada.Numerics.Discrete_Random(Rand_Range);
      seed : Rand_Int.Generator;
      Num : Rand_Range;
      voy_a_esperar : Integer;
      me_atendieron : Boolean := False; -- ¿ha sido atendido?
      tmp : Integer := 0; -- cantidad de sillas
      sg : Integer := 0; -- Corresponde al turno siguiente

   begin
      Rand_Int.Reset(seed);
      Num := Rand_Int.Random(seed);
      voy_a_esperar := Integer'Value (Rand_Range'Image(Num)); -- queda con un numero entre 30 y 45

      while (me_atendieron = False) loop

         if (voy_a_esperar = 0) then

            Put("Paciente");Put(e);Put(" : ");Put_Line("me voy");
            New_Line;
            sg :=  turno_paciente;
            sg :=  turno_paciente + 1;
            turno_paciente := sg;
            exit;

         elsif (cantidad_de_sillas > 0) then

            Put("Paciente");Put(e);Put(" : ");Put("me sentare y esperare mi turno");
            New_Line;

            tmp :=  cantidad_de_sillas;
            tmp :=  tmp - 1;
            cantidad_de_sillas := tmp;

            while (estado_del_dentista = 1) or (turno_paciente /= e) loop
               delay(0.1);
               end loop;

            if(estado_del_dentista = 0) and (turno_paciente = e) then
               estado_del_dentista := 1;

               tmp :=  cantidad_de_sillas;
               tmp :=  tmp + 1;
               cantidad_de_sillas := tmp;

                -- //////////////////////////////DEKKER/////////////////////////////////
               while (atiende_dentista=True)loop

               atiende_paciente := False;

         		while(turno /= 1) loop
            		null;
               		end loop;
                  atiende_paciente := True;

               end loop;

               -- SECCION CRITICA
               Put("Paciente");Put(e);Put(" : ");Put("estoy siendo atendido");
               New_Line;
               delay(15.0);
               me_atendieron := estado;
               estado := False;
               Put("Paciente");Put(e);Put(" : ");Put("Ya me atendieron , adios, me voy");
               New_Line;

            -- SECCION CRITICA

               turno := 0;
               atiende_paciente := False;

               estado_del_dentista :=0;

               sg :=  turno_paciente;
               sg :=  turno_paciente + 1;
               turno_paciente := sg;

             -- //////////////////////////////DEKKER/////////////////////////////////


            end if;


         elsif (cantidad_de_sillas = 0) then

            voy_a_esperar := voy_a_esperar -1;
            delay(1.0);


         end if;
      end loop;
   end pacientes;

-- ********************************DECLARACION DE OBJETOS**************************************

   type elDentista is access Dentista;
   type losPacientes is access pacientes;

   DentistaAtiende : elDentista;
   pacienteAtendido: losPacientes;

   type Rand_Range is range 1..5; -- Los pacientes llegan de forma aleatorea
   package Rand_Int is new Ada.Numerics.Discrete_Random(Rand_Range);
   seed : Rand_Int.Generator;
   Num : Rand_Range;
   llegada : Duration;


-- ********************************PROGRAMA INICIO**************************************
begin
   Rand_Int.Reset(seed);
   Num := Rand_Int.Random(seed);
   llegada := Duration'Value (Rand_Range'Image(Num)); -- hasta aca el random

   DentistaAtiende := new Dentista(15);
   for i in 1..15 loop
   delay(llegada);
   pacienteAtendido := new pacientes(i);
   end loop;

end Tarea;
