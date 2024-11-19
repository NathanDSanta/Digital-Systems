-- Test bench for Serial OR Exercise

--   architecture TB1 for the first part of the exercise
--

LIBRARY IEEE;
USE IEEE.Std_logic_1164.ALL;

ENTITY SerialOR_TB1 IS
END;

ARCHITECTURE TB1 OF SerialOR_TB1 IS

  -- For first part of exercise

  SIGNAL Clock, D, Q : STD_LOGIC;
  SIGNAL OK : BOOLEAN;
  SIGNAL StopClock : BOOLEAN;

BEGIN

  PROCESS
  BEGIN
    WHILE NOT StopClock LOOP
      Clock <= '0';
      WAIT FOR 5 ns;
      Clock <= '1';
      WAIT FOR 5 ns;
    END LOOP;
    WAIT;
  END PROCESS;

  PROCESS
  BEGIN
    REPORT "TB1";
    D <= '0';
    OK <= TRUE;

    WAIT FOR 40 ns;

    IF Q /= '0' THEN
      OK <= FALSE;
    END IF;

    D <= '1';

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    D <= '0';

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '0' THEN
      OK <= FALSE;
    END IF;

    D <= '1';

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    D <= '0';

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    D <= '1';

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    D <= '0';

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    D <= '1';

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    D <= '0';

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    D <= '1';

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    D <= '0';

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    D <= '1';

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    D <= '0';

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    D <= '1';

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    D <= '0';

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '1' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '0' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '0' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '0' THEN
      OK <= FALSE;
    END IF;

    WAIT FOR 10 ns;

    IF Q /= '0' THEN
      OK <= FALSE;
    END IF;

    StopClock <= TRUE;
    WAIT;
  END PROCESS;

  UUT : ENTITY work.serialor(behaviour) PORT MAP (Clock => Clock,
    D => D,
    O => Q);

END;