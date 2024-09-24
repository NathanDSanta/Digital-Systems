library ieee;
use ieee.std_logic_1164.all;
entity MUX4 is
  port (
    SEL : in STD_LOGIC_VECTOR(1 downto 0);
    A, B, C, D : in STD_LOGIC;
    F : out STD_LOGIC
  );
end MUX4;

architecture BEHAVIOUR of MUX4 is
  signal SEL1, SEL1B, SEL0, SEL0B : STD_LOGIC;
begin
  SEL1 <= SEL(1);
  SEL1B <= not SEL(1);
  SEL0 <= SEL(0);
  SEL0B <= not SEL(0);

  F <= (A and SEL1B and SEL0B) or
    (B and SEL1B and SEL0) or
    (C and SEL1 and SEL0B) or
    (D and SEL1 and SEL0);
end;