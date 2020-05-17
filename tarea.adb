with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;


procedure Tarea is

   cantidad_de_sillas : Integer := 4; --Sillas disponbles en la consulta
   estado_del_dentista : Integer := 0; --SEÑAL [1] 0 esta dormido ,1 esta despierto
   atiende_dentista : Boolean := True; --SEÑAL [0] esta en cierto
   atiende_paciente : Boolean := True; --SEÑAL [1] esta en CIERTO
   turno : Integer := 0;
   --estado : Boolean;

   task type Dentista(b: natural);
   task type pacientes(e: natural);

   -- ********************************DENTISTA**************************************
    task body Dentista is

   begin
      null;
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
               null;
               end loop;

            if(estado_del_dentista = 0) then
               estado_del_dentista := 1;
               me_atendieron := True;
               Put("Paciente");Put(e);Put(" : ");Put("estoy siendo atendido");

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

-- ********************************PROGRAMA INICIO**************************************
begin

   DentistaAtiende := new Dentista(20);
   for i in 1..6 loop
   delay(0.3);
   pacienteAtendido := new pacientes(i);
   end loop;

end Tarea;
