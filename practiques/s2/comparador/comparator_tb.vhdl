LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY comparator_tb IS
END comparator_tb;

ARCHITECTURE test_bench OF comparator_tb IS
  SIGNAL a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, s1, s2, s3 : STD_LOGIC;
BEGIN

  adder : ENTITY work.comparator(behaviour) PORT MAP(
    a1 => a1,
    a2 => a2,
    a3 => a3,
    a4 => a4,
    a5 => a5,
    b1 => b1,
    b2 => b2,
    b3 => b3,
    b4 => b4,
    b5 => b5,
    s1 => s1,
    s2 => s2,
    s3 => s3
    );

  PROCESS
  BEGIN
    a1 <= '0';
    a2 <= '0';
    a3 <= '0';
    a4 <= '0';
    a5 <= '0';
    b1 <= '0';
    b2 <= '0';
    b3 <= '0';
    b4 <= '0';
    b5 <= '0';
    WAIT FOR 10 ns;
    a5 <= '1';
    WAIT FOR 10 ns;
    b4 <= '1';
    WAIT FOR 10 ns;

    WAIT;
  END PROCESS;
END test_bench;
