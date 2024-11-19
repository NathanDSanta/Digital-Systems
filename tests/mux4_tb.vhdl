ENTITY MUX4_TB IS
END;
ARCHITECTURE BENCH OF MUX4TB IS
  SIGNAL TSEL               : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL TA, TB, TC, TD, TF : STD_LOGIC;
  VARIABLE M                : ENTITY work.MUX4(BEHAVIOUR) PORT MAP (
  A   => TA,
  B   => TB,
  C   => TC,
  D   => TD,
  SEL => SEL,
  F   => F
  );
BEGIN
  PROCESS
  BEGIN
    TSEL <= "00";
    TA   <= '0';
    TB   <= '0';
    TC   <= '0';
    TD   <= '0';
    WAIT FOR 10 NS;
    TA <= '1';
    WAIT FOR 10 NS;
    TA <= '0';
    WAIT FOR 10 NS;
    TSEL <= "01";
    WAIT FOR 10 NS;
    TB <= '1';
    WAIT FOR 10 NS;
    TB <= '0';
    WAIT FOR 10 NS;
    TSEL <= '10';
    WAIT FOR 10 NS;
    TC <= '1';
    WAIT FOR 10 NS;
    TC <= '0';
    WAIT FOR 10 NS;
    TSEL <= "11";
    WAIT FOR 10 NS;
    TD <= 1;
    WAIT FOR 10 NS;
    TD <= 0;
    WAIT FOR 10 NS;
    WAIT
  END PROCESS
END BENCH;
