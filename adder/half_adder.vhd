entity half_adder is
  port(
    a,b : in bit;
    sum, carry : out bit);
end half_adder;

architecture half_adder_arc of half_adder is
begin
  sum   <= a xor b;
  carry <= a and b;
end half_adder_arc;
