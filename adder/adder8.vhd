library work;
use work.u8.all;

entity adder8 is
  port (
    a : in unsigned8;
    b : in unsigned8;
    sum : out unsigned8;
    carry : out bit
  );
end;

architecture adder8_arc of adder8 is
  signal c : unsigned9;
begin
  c(0) <= '0';
  adders : for i in 0 to 7 generate
    fa2 : entity work.adder
      port map (carry_in => c(i), a => a(i), b => b(i), sum => sum(i), carry => c(i+1));
  end generate;

  carry <= c(8);
end;
