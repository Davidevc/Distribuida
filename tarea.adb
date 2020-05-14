with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Float_Random;
with Semaforos;

procedure Tarea is

  package Paquete_Semaforos is new Semaforos;

  use Paquete_Semaforos;
  Semaforo: TSemaforo;

       task Pizzero;
    task Comensal;

    PizzasEnElMeson : Integer := 0;
    turno : Integer := 0;

    task body Pizzero is
        tmp : Integer := 0;
    begin
        for i in 1..10 loop
            put_line("   preparare una pizza");
            delay(1.0); -- demora en preparar pizza
            put_line("   prepare la pizza, la pondre al meson");

	Wait (Semaforo);


            tmp :=  PizzasEnElMeson;
            tmp :=  tmp + 1;
            put_line("   poniendo la pizza en el meson");
            PizzasEnElMeson := tmp;


        Signal (Semaforo);

            put("***** hay");put(PizzasEnElMeson);put_line(" pizzas");
        end loop;
    end Pizzero;


    task body Comensal is
        tmp : Integer := 0;
    begin
        for i in 1..10 loop

            put_line("voy a sacar una pizza");

            Wait (Semaforo);

            tmp :=  PizzasEnElMeson;
            put_line("accediendo al meson");
            tmp :=  tmp - 1;
            PizzasEnElMeson := tmp;

            Signal (Semaforo);

            put_line("me voy a comer la pizza");
            delay(10.0); -- demora en comer pizza
            put_line("me comi la pizza");

            put("$$$$ HAY");put(PizzasEnElMeson);put_line(" PIZZAS");
        end loop;
    end Comensal;


begin  -- Aquí se inicia la tarea de tipo TSemaforo (objeto Semaforo).
  null;

end Tarea;
