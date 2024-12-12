library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity panyElectronic_tb is
end entity panyElectronic_tb;

architecture rtl of panyElectronic_tb is

  component panyElectronic is
    port(
      tecles : in std_logic_vector(9 downto 0);
      clk, reset : in std_logic;
      ready, Tecla, eCodi, pOberta, pTancada: out std_logic
        );
  end component;

  signal clk, reset : std_logic;
  signal tecles : std_logic_vector(9 downto 0);
begin
  pany : panyElectronic
  port map(
            clk => clk,
            reset => reset,
            tecles => tecles
          );

  Clock: process
  begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
  end process Clock;
  
  main: process
  begin
    reset <= '0';
    tecles <= "0000000000";
    wait for 25 ns;
    tecles <= "0000000100";
    wait for 25 ns;
    tecles <= "0000000000";
    wait for 25 ns;
    tecles <= "0000001000";
    wait for 25 ns;
    tecles <= "0000000000";
    wait for 25 ns;
    tecles <= "0000100000";
    wait for 25 ns;
    tecles <= "0000000000";
    wait for 25 ns;
    tecles <= "0000000010";
    wait for 25 ns;
    tecles <= "0000000000";
    wait for 25 ns;

    wait for 50 ns;

    tecles <= "0000000000";
    wait for 25 ns;
    tecles <= "0000000010";
    wait for 25 ns;
    tecles <= "0000000000";
    wait for 25 ns;
    tecles <= "0000001000";
    wait for 25 ns;
    tecles <= "0000000000";
    wait for 25 ns;
    tecles <= "0000100000";
    wait for 25 ns;
    tecles <= "0000000000";
    wait for 25 ns;
    tecles <= "0000000010";
    wait for 25 ns;
    tecles <= "0000000000";
    wait for 25 ns;

  end process main; 
end architecture rtl;
