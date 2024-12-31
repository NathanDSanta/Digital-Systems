-- Template for Finite State Machine Exercise

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FSM is
  port (Clock, nSysReset: in STD_LOGIC;
        Buttons: in STD_LOGIC_VECTOR(1 to 2);
        WatchRunning, WatchReset: out STD_LOGIC);
end;

architecture RTL of FSM is
  type StateType is (ZERO, START, RUNNING, STOP, STOPPED, RESET);
  signal State, NextState : Statetype; 
begin

  Registers: process(Clock, nSysReset)
  begin
    if nSysReset = '0' then
      State <= ZERO; 
    elsif rising_edge(Clock) then
      State <= NextState; 
    end if;
  end process Registers;

  CombLogic: process(State, Buttons)
  begin
    NextState <= State;
    case State is
      when ZERO =>
        WatchRunning <= '0';
        WatchReset <= '0';
        if Buttons(1) = '1' then
          NextState <= START;
        end if;
        
      when START =>
        WatchRunning <= '1';
        WatchReset <= '0';
        if Buttons = "00" then
          NextState <= RUNNING;
        end if;
        
      when RUNNING =>
        WatchRunning <= '1';
        WatchReset <= '0';
        if Buttons(1) = '1' then
          NextState <= STOP;
        end if;
        
      when STOP =>
        WatchRunning <= '0';
        WatchReset <= '0';
        if Buttons = "00" then
          NextState <= STOPPED;
        end if;
        
      when STOPPED =>
        WatchRunning <= '0';
        WatchReset <= '0';
        if Buttons(1) = '1' then
          NextState <= START;
        elsif Buttons = "01" then
          NextState <= RESET;
        end if;
        
      when RESET =>
        WatchRunning <= '0';
        WatchReset <= '1';
        if Buttons = "00" then
          NextState <= ZERO;
        end if;
        
    end case;
  end process CombLogic;

end;

