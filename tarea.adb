with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;


procedure Tarea is

   cantidad_de_sillar : Integer := 4; --Sillas disponbles en la consulta
   estado_del_dentista : Integer := 1; --SEÑAL [1] esta despierto

   task type Dentista(b: natural);
   task type pacientes(e: natural);

    task body Dentista is

   begin

      put_line("Dentista: Se me acaba el argumento, y la metodologia");
      put_line("Cada vez que se aparece frente, a mi tu anatomia");
      new_line;

   end Dentista;


   task body pacientes is

      type Rand_Range is range 30..45;
      package Rand_Int is new Ada.Numerics.Discrete_Random(Rand_Range);
      seed : Rand_Int.Generator;
      Num : Rand_Range;
      I : Integer;

   begin
      Rand_Int.Reset(seed);
      Num := Rand_Int.Random(seed);
      I := Integer'Value (Rand_Range'Image(Num));

      Put(I);




      for i in 1..7 loop
         if (i rem 2) = 0 then
            put("Enano ");
            put(i);
            put(" : puedo escribir los versos mas tristes esta noche");
            new_line;

         else
            put("Enano ");
            put(i);
            put(" : Cumpleanios feliz, te deseamos a ti");
            new_line;
            end if;
        end loop;

   end pacientes;


   type elDentista is access Dentista;
   type losPacientes is access pacientes;

   DentistaAtiende : elDentista;
   pacienteAtendido: losPacientes;

begin
    DentistaAtiende := new Dentista(20);
    pacienteAtendido := new pacientes(21);

end Tarea;
