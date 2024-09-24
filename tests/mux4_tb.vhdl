library ieee;
use ieee.std_logic_1164.all;

entity MUX4_TB is
end;
architecture BENCH of MUX4_TB is
  signal TSEL : STD_LOGIC_VECTOR(1 downto 0);
  signal TA, TB, TC, TD, TF : STD_LOGIC;
begin
  M : entity work.MUX4(BEHAVIOUR) port map (
    A => TA,
    B => TB,
    C => TC,
    D => TD,
    SEL => TSEL,
    F => TF
    );
  process
  begin
    TSEL <= "00";
    TA <= '0';
    TB <= '0';
    TC <= '0';
    TD <= '0';
    wait for 10 NS;
    TA <= '1';
    wait for 10 NS;
    TA <= '0';
    wait for 10 NS;
    TSEL <= "01";
    wait for 10 NS;
    TB <= '1';
    wait for 10 NS;
    TB <= '0';
    wait for 10 NS;
    TSEL <= "10";
    wait for 10 NS;
    TC <= '1';
    wait for 10 NS;
    TC <= '0';
    wait for 10 NS;
    TSEL <= "11";
    wait for 10 NS;
    TD <= '1';
    wait for 10 NS;
    TD <= '0';
    wait for 10 NS;
    wait;
  end process;
end BENCH;