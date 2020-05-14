generic
  ValorInicial: Natural := 1;  -- Par�m. gen�rico con valor por defecto.
package Semaforos is

   type TSemaforo is limited private;
  procedure Wait (Sem: in out TSemaforo);
  procedure Signal (Sem: in out TSemaforo);
private
  task type TSemaforo is
    entry Wait;
    entry Signal;
  end TSemaforo;

end Semaforos;
