-- ALU Exercise

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_std.all;

entity ALU is
  port (A, B : in  std_logic_vector(7 downto 0);
        Op   : in  std_logic_vector(3 downto 0);
        F    : out std_logic_vector(7 downto 0);
        Cout : out Std_logic;
        Equal: out Std_logic);
end;


architecture A1 of ALU is
  signal x, y, fx: signed(8 downto 0);

begin
  x <= resize(signed(A),9);
  y <= resize(signed(B),9);
  process (Op,x,y,fx)  
  begin
    case Op is
    when "0000" =>
      -- AplusB
      fx <= x + y;
    when "0001" =>
      -- AminusB
      fx <= x - y;
    when "0010" =>
      -- BminusA
      fx <= y - x;
    when "0100" =>
      -- OnlyA
      fx <= x;
    when "0101" =>
      -- OnlyB
      fx <= y;
    when "0110" =>
      -- minusA
      fx <= "000000000"-x;
    when "0111" =>
      -- minusB
      fx <= "000000000"-y;
    when "1000" =>
      -- ShiftleftA
      fx <= shift_left(x,1);
    when "1001" =>
      -- ShiftrightA
      fx <= "00" & x(7 downto 1);
    when "1010" =>
      -- RotateleftA
      fx <= x(7 downto 0) & x(7);
    when "1011" =>
      -- RotaterightA
      fx <= ('0' & x(0) & x(7 downto 1));
    when "1110" =>
      -- AllZeros
      fx <= "000000000";
    when "1111" =>
      -- AllOnes
      fx <= "111111111";
    when others =>
      fx <= "000000000";
      -- Dummy3
      -- Dummy12
      -- Dummy13
    end case;
    F <= std_logic_vector(fx(7 downto 0));
    Cout <= fx(8);
    if A = B then
      Equal <= '1';
    else
      Equal <= '0';
    end if;
  end process;

end;
