LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- A testbench has no ports.
ENTITY adder_tb IS
END adder_tb;
ARCHITECTURE behav OF adder_tb IS
  -- Declaration of the component that will be instantiated.
  COMPONENT adder
    PORT (
      i0, i1 : IN STD_LOGIC;
      ci     : IN STD_LOGIC;
      s      : OUT
      STD_LOGIC;
      co : OUT STD_LOGIC);
  END COMPONENT;
  -- Specifies which entity is bound with the component.
  FOR adder_0              : adder USE ENTITY work.adder;
  SIGNAL i0, i1, ci, s, co : STD_LOGIC;
BEGIN
  -- Component instantiation.
  adder_0 : adder PORT MAP(
    i0 => i0, i1 => i1, ci => ci,
    s => s, co => co);
  -- This process does the real job.
  PROCESS
    TYPE pattern_type IS RECORD
      -- The inputs of the adder.
      i0, i1, ci : STD_LOGIC;
      -- The expected outputs of the adder.
      s, co : STD_LOGIC;
    END RECORD;
    -- The patterns to apply.
    TYPE pattern_array IS ARRAY (NATURAL RANGE <>) OF
    pattern_type;
    CONSTANT patterns : pattern_array :=
    (('0', '0', '0', '0', '0'),
    ('0', '0', '1', '1', '0'),
    ('0', '1', '0', '1', '0'),
    ('0', '1', '1', '0', '1'),
    ('1', '0', '0', '1', '0'),
    ('1', '0', '1', '0', '1'),
    ('1', '1', '0', '0', '1'),
    ('1', '1', '1', '1', '1'));
  BEGIN
    -- Check each pattern.
    FOR i IN patterns'RANGE LOOP
      -- Set the inputs.
      i0 <= patterns(i).i0;
      i1 <= patterns(i).i1;
      ci <= patterns(i).ci;
      -- Wait for the results.
      WAIT FOR 1 ns;
      -- Check the outputs.
      ASSERT s = patterns(i).s
      REPORT "bad sum value" SEVERITY error;
      ASSERT co = patterns(i).co
      REPORT "bad carray out value" SEVERITY error;
    END LOOP;
    ASSERT false REPORT "end of test" SEVERITY note;
    -- Wait forever; this will finish the simulation.
    WAIT;
  END PROCESS;
END behav;
