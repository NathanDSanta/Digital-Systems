library IEEE;
use IEEE.Std_logic_1164.all;

entity Ram_TB is
end entity Ram_TB;

architecture Bench of Ram_TB is
signal datain, dataout : std_logic_vector(7 downto 0);
signal address : std_logic_vector(9 downto 0);
signal clock, we : std_logic;
begin
  G1 : entity work.ram1k8(RTL) port map(
                          clock => clock, we => we, address => address, datain => datain, dataout => dataout
                        );
  process
  begin
    we <= '0';
    dataout <= "00000000";
    datain <= "01101010";
    address <= "0000000000";
    we <= '1';
    wait for 15 ns;
    we <= '0';

    datain <= "00011100";
    address <= "0000000001";
    we <= '1';
    wait for 15 ns;
    we <= '0';

    wait for 25 ns;
    address <= "0000000000";
    wait for 25 ns;
    wait;
end process;
clk: process
begin
  clock <= '0';
  wait for 5 ns;
  clock <= '1';
  wait for 5 ns;
end process clk;
end architecture Bench;
