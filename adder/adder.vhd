entity adder is
  port (
    a : in bit;
    b : in bit;
    carry_in : in bit;
    sum : out bit;
    carry : out bit
  );
end adder;

architecture adder_arc of adder is
  component half_adder is
    port (a,b : in bit; sum,carry : out bit);
  end component half_adder;

  component or_gate is
    port (a,b : in bit; res : out bit);
  end component or_gate;

  signal sum_intermediate : bit;
  signal carry_intermediate1 : bit;
  signal carry_intermediate2 : bit;
begin

  ha1 : half_adder
    port map (
      a => a,
      b => b,
      sum => sum_intermediate,
      carry => carry_intermediate1);

  ha2 : half_adder
    port map (
      a => sum_intermediate,
      b => carry_in,
      sum => sum,
      carry => carry_intermediate2);

  g1 : or_gate
    port map (
      a => carry_intermediate1,
      b => carry_intermediate2,
      res => carry);
      
end;
