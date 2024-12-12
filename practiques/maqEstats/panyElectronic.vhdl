library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity panyElectronic is
  port (
    tecles : in std_logic_vector(9 downto 0);
    clk, reset : in std_logic;
    ready, Tecla, eCodi, pOberta, pTancada: out std_logic
  );
end entity panyElectronic;

architecture rtl of panyElectronic is
  type StateType is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16);
  signal State, NextState : StateType;
begin

  Registers: process(clk, reset)
  begin
    if reset = '1' then
      State <= S0; 
    elsif rising_edge(clk) then
      State <= NextState; 
    end if;
  end process Registers;

  C_logic: process(State, tecles)
  begin
    NextState <= State;
    case State is
      when S0 =>
        ready <= '1';
        Tecla <= '0';
        eCodi <= '0';
        pOberta <= '0';
        pTancada <= '0';
        if tecles = "0000000100" then
          NextState <= S1;        
        elsif tecles /= "0000000000" then
          NextState <= S2;
        end if;
      when S1 =>
        ready <= '0';
        eCodi <= '1';
        Tecla <= '1';
        if tecles = "0000000000" then
          NextState <= S3;        
        end if;
      when S2 =>
        ready <= '0';
        eCodi <= '1';
        Tecla <= '1';
        if tecles = "0000000000" then
          NextState <= S4;        
        end if;
      when S3 =>
        Tecla <= '0';
        if tecles = "0000001000" then
          NextState <= S5;        
        elsif tecles /= "0000000000" then
          NextState <= S6;
        end if;
      when S4 =>
        Tecla <= '0';
        if tecles = "0000000000" then
          NextState <= S6;        
        end if;
      when S5 =>
        Tecla <= '1';
        if tecles = "0000000000" then
          NextState <= S7;        
        end if;
      when S6 =>
        Tecla <= '1';
        if tecles = "0000000000" then
          NextState <= S8;        
        end if;
      when S7 =>
        Tecla <= '0';
        if tecles = "0000100000" then
          NextState <= S9;        
        elsif tecles /= "0000000000" then
          NextState <= S10;
        end if;
      when S8 =>
        Tecla <= '0';
        if tecles = "0000000000" then
          NextState <= S10;        
        end if;
      when S9 =>
        Tecla <= '1';
        if tecles = "0000000000" then
          NextState <= S11;        
        end if;
      when S10 =>
        Tecla <= '1';
        if tecles = "0000000000" then
          NextState <= S12;        
        end if;
      when S11 =>
        Tecla <= '0';
        if tecles = "0000000010" then
          NextState <= S13;        
        elsif tecles /= "0000000000" then
          NextState <= S14;
        end if;
      when S12 =>
        Tecla <= '0';
        if tecles = "0000000000" then
          NextState <= S14;        
        end if;
      when S13 =>
        Tecla <= '1';
        if tecles = "0000000000" then
          NextState <= S15;        
        end if;
      when S14 =>
        Tecla <= '1';
        if tecles = "0000000000" then
          NextState <= S16;        
        end if;
      when S15 =>
        pOberta <= '1';
        eCodi <= '0';
        Tecla <= '0';
        NextState <= S0;
      when S16 =>
        pTancada <= '1';
        eCodi <= '0';
        Tecla <= '0';
        NextState <= S0;
    end case;
  end process C_logic;
end architecture rtl;
