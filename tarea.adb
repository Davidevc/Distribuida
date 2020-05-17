with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;


procedure Tarea is

   cantidad_de_sillas : Integer := 4; --Sillas disponbles en la consulta
   estado_del_dentista : Integer := 0; --SEÑAL [1] 0 esta dormido ,1 esta despierto
   atiende_dentista : Boolean := True; --SEÑAL [0] esta en cierto
   atiende_paciente : Boolean := True; --SEÑAL [1] esta en CIERTO
   turno : Integer := 0;
   estado : Boolean;

   task type Dentista(b: natural);
   task type pacientes(e: natural);

   -- ********************************DENTISTA**************************************
    task body Dentista is

   begin
      Put_Line("Soy el dentista, estoy atendiendo");
      while (atiende_paciente=True)loop
         atiende_dentista := False;

         	while(turno /= 0) loop
            	null;
         	end loop;

         atiende_dentista := True;
      end loop;

      -- SECCION CRITICA
      estado := True;
      delay(1.0);
      -- SECCION CRITICA

      turno := 1;
      atiende_dentista := False;

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

         if (voy_a_esperar = 0) then

            Put("Paciente");Put(e);Put(" : ");Put_Line("me voy");
            New_Line;
            exit;
            --cantidad_de_sillas := 1;

         elsif (cantidad_de_sillas > 0) then

            Put("Paciente");Put(e);Put(" : ");Put("me sentare y esperare mi turno");
            New_Line;

            -- SECCION CRITIRA
            tmp :=  cantidad_de_sillas;
            tmp :=  tmp - 1;
            cantidad_de_sillas := tmp;

            while (estado_del_dentista = 1) loop
               delay(0.1);
               end loop;

            if(estado_del_dentista = 0) then
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
               delay(20.0);
               me_atendieron := estado;
               estado := False;

            -- SECCION CRITICA

               turno := 0;
               atiende_paciente := False;
               Put("Paciente");Put(e);Put(" : ");Put("adios, me voy");
               New_Line;
               estado_del_dentista :=0;

             -- //////////////////////////////DEKKER/////////////////////////////////

               exit;
            end if;


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

   type Rand_Range is range 1..5; -- hay que cambiarlo a 30..45
   package Rand_Int is new Ada.Numerics.Discrete_Random(Rand_Range);
   seed : Rand_Int.Generator;
   Num : Rand_Range;
   llegada : Duration;


-- ********************************PROGRAMA INICIO**************************************
begin
   Rand_Int.Reset(seed);
   Num := Rand_Int.Random(seed);
   llegada := Duration'Value (Rand_Range'Image(Num));

   DentistaAtiende := new Dentista(20);
   for i in 1..10 loop
   delay(llegada);
   pacienteAtendido := new pacientes(i);
   end loop;

end Tarea;
