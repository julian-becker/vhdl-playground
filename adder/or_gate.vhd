entity or_gate is
  port (
    a : in bit;
    b : in bit;
    res : out bit);
end entity or_gate;

architecture or_gate_arc of or_gate is
begin
  res <= a or b;
end;
