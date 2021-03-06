library ieee;
library std;
use ieee.std_logic_1164.all;
use work.seven_segment_pkg.all;
use std.textio.all;
entity main is
begin
end;

architecture main_arch of main is
  signal segments : std_ulogic_vector(6 downto 0);
  -- signal reg_sig : register_file_type(0 to 31)(0 to 8);
  signal clock : std_ulogic := '0';
  signal reset : std_ulogic;
  signal digit : natural range 0 to 9;

begin
  sc : entity work.slow_counter
    generic map (
      CLOCK_FREQUENCY_Hz => 100)
    port map (
      clock => clock,
      reset => reset,
      digit => digit);

  process
  begin
    clock <= '0';
    reset <= '1';
    wait for 1 ns;
    reset <= '0';
    wait for 1 ns;
    assert digit = 0;


    for n in 1 to 9 loop
      for i in 1 to 100 loop
        clock <= not clock;
        wait for 0.5 ns;
        clock <= not clock;
        wait for 0.5 ns;
      end loop;

      assert digit = n;
    end loop;

    for n in 0 to 9 loop
      for i in 1 to 100 loop
        clock <= not clock;
        wait for 0.5 ns;
        clock <= not clock;
        wait for 0.5 ns;
      end loop;

      assert digit = n;
    end loop;

    segments <= seven_seg_from_integer(0);
    wait for 1 ns;
    assert segments = "0111111";

    segments <= seven_seg_from_integer(1);
    wait for 1 ns;
    assert segments = "0000110";

    segments <= seven_seg_from_integer(2);
    wait for 1 ns;
    assert segments = "1011011";

    segments <= seven_seg_from_integer(3);
    wait for 1 ns;
    assert segments = "1001111";

    report "done";
    wait;
  end process;
end;
