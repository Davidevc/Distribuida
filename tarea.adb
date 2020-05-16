with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;


procedure Tarea is

   cantidad_de_sillas : Integer := 0; --Sillas disponbles en la consulta
   estado_del_dentista : Integer := 1; --SEÑAL [1] esta despierto

   task type Dentista(b: natural);
   task type pacientes(e: natural);

   -- ********************************DENTISTA**************************************
    task body Dentista is

   begin
      put_line("Blancanieves: Se me acaba el argumento, y la metodologia");

   end Dentista;

   -- ********************************PACIENTE**************************************
   task body pacientes is

      type Rand_Range is range 30..45;
      package Rand_Int is new Ada.Numerics.Discrete_Random(Rand_Range);
      seed : Rand_Int.Generator;
      Num : Rand_Range;
      voy_a_esperar : Integer;
      me_atendieron : Boolean := False;

   begin
      Rand_Int.Reset(seed);
      Num := Rand_Int.Random(seed);
      voy_a_esperar := Integer'Value (Rand_Range'Image(Num));

      while (cantidad_de_sillas=0) loop
         delay(1.0);
         if (voy_a_esperar = 0) then

            Put_Line("me voy");
            cantidad_de_sillas := 1;

         else

            voy_a_esperar := voy_a_esperar -1;
            Put("Paciente");Put(e);Put(" : ");Put(voy_a_esperar);
            New_Line;

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
   for i in 1..3 loop
   delay(0.3);
   pacienteAtendido := new pacientes(i);
   end loop;

end Tarea;
