LIBRARY IEEE;
USE IEEE.Std_logic_1164.ALL;

ENTITY serialor IS
  PORT (
    D, Clock : IN STD_LOGIC;
    O : OUT STD_LOGIC
  );
END ENTITY serialor;

ARCHITECTURE behaviour OF serialor IS
  SIGNAL D1, D2, D3, D4 : STD_LOGIC;
BEGIN
  FFD : PROCESS (Clock)
  BEGIN
    IF Rising_edge(Clock) THEN
      D4 <= D3;
      D3 <= D2;
      D2 <= D1;
      D1 <= D;
    END IF;
  END PROCESS;

  O <= D1 OR D2 OR D3 OR D4;

END behaviour;