library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
entity alu is
 Port ( inp_a : in STD_LOGIC_VECTOR(4 downto 0);
 inp_b : in STD_LOGIC_VECTOR (4 downto 0);
 sel : in STD_LOGIC_VECTOR (3 downto 0);
 out_alu : out STD_LOGIC_VECTOR (4 downto 0));
end alu;
 
architecture Behavioral of alu is
  signal temp : STD_LOGIC_VECTOR (2 downto 0);
begin
process(inp_a, inp_b, sel)
begin
case sel is
when "0001" =>
temp <=  
when "0010" =>
when "0100" =>
when "1000" =>
when others =>
end case;
  
end process;
 
end Behavioral;
 