use std.textio.all;
library work;
use work.u8.all;

entity main is
end main;

architecture main_arc of main is
  signal a, b, sum : unsigned8;
  signal carry : bit;
begin

  a4 : entity work.adder8
    port map (a, b, sum, carry);

  process
  begin


    a <= "00001000";
    b <= "00001000";
    wait for 1 ns;
    assert sum = "00010000";

    a <= "00001111";
    b <= "01001000";
    wait for 1 ns;
    assert sum = "01010111";


    report "done";
    wait;
  end process;
end main_arc;
