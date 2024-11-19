----------- Test bench Template for Minmax Exercise -------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MinMax_TB is
end;

architecture TB1 of MinMax_TB is
  signal minmax : std_logic;
  signal A, B, R: std_logic_vector (3 downto 0);
begin
  G: entity work.MinMax(RTL1) port map (
                          Min0Max1 => minmax,
                          X => A,
                          Y => B,
                          Z => R
                       );

  process is
  begin
    minmax <= '0';
    A <= "0010";
    B <= "1001";
    wait for 10 ns;
    minmax <= '1';
    wait for 10 ns;
    A <= "1001";
    wait for 10 ns;
    B <= "1010";
    wait for 10 ns;
end process;
end TB1;
