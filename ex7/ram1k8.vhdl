library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity ram1k8 is
  port (clock   : in std_logic;
        we      : in std_logic;
        address : in std_logic_vector(9 downto 0);
        datain  : in std_logic_vector(7 downto 0);
        dataout : out std_logic_vector(7 downto 0)
        );
end entity ram1k8;

architecture RTL of ram1k8 is
  type RAM1Kx8 is array(0 to 1023) of STD_LOGIC_VECTOR(7 downto 0);
  signal RAM: RAM1Kx8;
begin
  RAMPROC: process(clock)
  begin
    if rising_edge(clock) then
      if we = '1' then
        RAM(to_integer(unsigned(address))) <= datain;
      end if;  
      dataout <= RAM(to_integer(unsigned(address)));
    end if;
  end process RAMPROC;
end architecture RTL;
