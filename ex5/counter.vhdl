-- Template for the Counter Exercise

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_std.all;

entity Counter is
  port (Clock, Reset, Enable, Load, UpDn: in Std_logic;
        Data: in Std_logic_vector(7 downto 0);
        Q:   inout Std_logic_vector(7 downto 0));
end;

architecture RTL of Counter is
signal unsignedQ : unsigned(7 downto 0);

begin
  process (Clock, Reset, Enable, Load, UpDn) is
  begin
    unsignedQ <= unsigned(Q);
    if Reset = '1' then
      Q <= "00000000";
    elsif Rising_Edge(Clock) then
      if Enable = '1' then
        if Load = '1' then
          Q <= Data;
        elsif UpDn = '0' then
          Q <= Std_logic_vector(unsignedQ - 1);
        else
          Q <= Std_logic_vector(unsignedQ + 1);
        end if;
      end if;

    end if;
  end process;

end;
