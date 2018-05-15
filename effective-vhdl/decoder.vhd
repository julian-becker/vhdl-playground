library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package seven_segment_pkg is
  function seven_seg_from_integer(digit: integer)
    return std_ulogic_vector;

end;

package body seven_segment_pkg is
  function seven_seg_from_integer(digit: integer)
    return std_ulogic_vector
  is
    type conversion_array_type is array (0 to 9) of std_ulogic_vector(6 downto 0);
    constant CONVERSION_ARRAY : conversion_array_type := (
      "0111111", "0000110", "1011011", "1001111", "1100110",
      "1101101", "1111101", "0000111", "1111111", "1101111");
  begin
    return CONVERSION_ARRAY(digit);
  end;


end;
--
-- entity decoder is
--   port (
--     digit    : in integer range 0 to 9;
--     segments : out std_ulogic_vector(6 downto 0)
--   );
-- end;
--
-- architecture decoder_arch of decoder is
-- begin
--   with digit select
--     segments <=
--       "0111111" when 0,
--       "0000110" when 1,
--       "1011011" when 2,
--       "1001111" when 3,
--       "1100110" when 4,
--       "1101101" when 5,
--       "1111101" when 6,
--       "0000111" when 7,
--       "1111111" when 8,
--       "1101111" when 9,
--       "0000000" when others;
-- end;
--
-- architecture decoder_arch2 of decoder is
-- begin
--   segments <=
--     "0111111" when digit = 0 else -- 0000
--     "0000110" when digit = 1 else -- 0001
--     "1011011" when digit = 2 else -- 0010
--     "1001111" when digit = 3 else -- 0011
--     "1100110" when digit = 4 else -- 0100
--     "1101101" when digit = 5 else -- 0101
--     "1111101" when digit = 6 else -- 0110
--     "0000111" when digit = 7 else -- 0111
--     "1111111" when digit = 8 else -- 1000
--     "1101111" when digit = 9 else -- 1001
--     "0000000";
-- end;
