library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_tb is
end entity alu_tb;

architecture rtl of alu_tb is
  signal A, B, F : std_logic_vector(4 downto 0);
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
    -- Cas de test 1: Comparació (A < B)
    sel <= "0001";
    A <= "01100"; -- A = 12
    B <= "00010"; -- B = 2
    assert display1 = "00000000"report "Display 1 correcta" severity note;
    assert display2 = STD_LOGIC_VECTOR(to_unsigned(80, 8)) report "Display 2 correcta" severity note;
    assert display3 = STD_LOGIC_VECTOR(to_unsigned(111, 8)) report "Display 3 correcta" severity note;
    wait for 10 ns;

    -- Cas de test 2: Suma (A + B)
    sel <= "0010";
    assert F="01110" report "Suma correcta" severity note;
    wait for 10 ns;

    -- Cas de test 3: Resta (A - B)
    sel <= "0100";
    assert F="01010" report "Resta correcta" severity note;
    wait for 10 ns;

    -- Cas de test 4: Shift (A << B)
    sel <= "1000";
    assert F="10000" report "Shift correcte" severity note;
    wait for 10 ns;
    wait;

    -- Fi de la simulació
  end process;
  
end architecture rtl;
