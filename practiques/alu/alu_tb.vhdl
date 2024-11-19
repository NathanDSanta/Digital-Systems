library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_tb is
end entity alu_tb;

architecture rtl of alu_tb is
  signal A,B,F : std_logic_vector(4 downto 0);
  signal sel : std_logic_vector(3 downto 0);
  signal display1 : std_logic_vector(7 downto 0);
  signal display2 : std_logic_vector(7 downto 0);
  signal display3 : std_logic_vector(7 downto 0);
begin
  G1 : entity work.alu(behaviour) port map(
                inp_a => A, inp_b => B,
                sel => sel, display1 => display1,
                display2 => display2, display3 => display3,
                out_alu => F
              ); 
  process is 
  begin
    sel <= "0001";
    A <= "01100";
    B <= "00010";
    wait for 10 ns;
    sel <= "0010";
    wait for 10 ns;
    sel <= "0100";
    wait for 10 ns;
    sel <= "1000";
    wait;
  end process;
  
end architecture rtl;
