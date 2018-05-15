library ieee;
use ieee.std_logic_1164.all;

entity slow_counter is
  generic (
    CLOCK_FREQUENCY_Hz : natural
  );
  port (
    clock : in std_ulogic;
    digit : out natural range 0 to 9
  );
end;

architecture slow_counter_arch of slow_counter is
begin
  process (clock)
    constant COUNTER_MAX : natural := CLOCK_FREQUENCY_Hz - 1;
    variable count       : natural range 0 to COUNTER_MAX := 0;
  begin
    if rising_edge(clock) then
      if count < COUNTER_MAX then
        count := count + 1;
      else
        count := 0;
      end if;

      digit <= digit + 1 when count = 0 and digit < 9 else
               digit     when digit < 9 else
               0;

    end if;
  end process;
end;
