library ieee;
use ieee.std_logic_1164.all;

entity slow_counter is
  generic (
    CLOCK_FREQUENCY_Hz : natural
  );
  port (
    clock : in std_ulogic;
    reset : in std_ulogic;
    digit : out natural range 0 to 9
  );
end;

architecture slow_counter_arch of slow_counter is
  constant COUNTER_MAX : natural := CLOCK_FREQUENCY_Hz - 1;

  type state_t is record
    count : natural range 0 to COUNTER_MAX;
    digit : natural range 0 to 9;
  end record state_t;

  signal state : state_t;
  signal next_state : state_t;
begin

  process (state)
  begin
      digit <= state.digit;
      next_state.count <= state.count + 1 when state.count < COUNTER_MAX else 0;
      next_state.digit <= state.digit + 1 when state.digit < 9 and state.count = 0 else
                          state.digit     when state.digit < 9 else 0;
  end process;

  process (clock, reset)
  begin
    if reset then
      state <= (count => 1, digit => 0);
    elsif rising_edge(clock) then
      state <= next_state;
    end if;
  end process;

end;
