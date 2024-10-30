----------- Template for MinMax Exercise --------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MinMax is
  port (Min0Max1: in  STD_LOGIC;
        X, Y    : in  STD_LOGIC_VECTOR (3 downto 0);
        Z       : out STD_LOGIC_VECTOR (3 downto 0));
end;

architecture RTL1 of MinMax is
begin

  Z <=  X when X = Y or (Min0Max1 = '0' and X < Y) or (Min0Max1 = '1' and X > Y) else
        Y when (Min0Max1 = '0' and Y < X) or (Min0Max1 = '1' and Y > X) else
        "0000";
end RTL1;

