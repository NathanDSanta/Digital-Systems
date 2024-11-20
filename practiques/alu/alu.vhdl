library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    Port ( inp_a : in STD_LOGIC_VECTOR(4 downto 0);
           inp_b : in STD_LOGIC_VECTOR (4 downto 0);
           sel : in STD_LOGIC_VECTOR (3 downto 0);
           display1 : out STD_LOGIC_VECTOR(7 downto 0);
           display2 : out STD_LOGIC_VECTOR(7 downto 0);
           display3 : out STD_LOGIC_VECTOR(7 downto 0);
           out_alu : out STD_LOGIC_VECTOR (4 downto 0));
end alu;

architecture behaviour of alu is
    signal A, B, resultat : STD_LOGIC_VECTOR (4 downto 0);
    signal temp : unsigned(4 downto 0);
begin
    process(inp_a, inp_b, sel)
    begin
        A <= inp_a;
        B <= inp_b;
        case sel is
            when "0001" => -- Comparacio
              resultat <= "00000";
                if (A < B) then
                    display1 <= "00000000";
                    display2 <= STD_LOGIC_VECTOR(to_unsigned(80, 8));
                    display3 <= STD_LOGIC_VECTOR(to_unsigned(111, 8));
                elsif (A = B) then
                    display1 <= "00000000";
                    display2 <= STD_LOGIC_VECTOR(to_unsigned(121, 8));
                    display3 <= STD_LOGIC_VECTOR(to_unsigned(103, 8));
                else
                    display1 <= "00000000";
                    display2 <= STD_LOGIC_VECTOR(to_unsigned(56, 8));
                    display3 <= STD_LOGIC_VECTOR(to_unsigned(111, 8));
                end if;
            when "0010" => -- Suma
                resultat <= STD_LOGIC_VECTOR(unsigned(A) + unsigned(B));
            when "0100" => -- Resta
                temp <= unsigned(A) - unsigned(B);
                display1 <= "00000000";
                display2 <= "00000000";
                display3 <= "00000000";
                if (temp < 0) then
                  display3 <= STD_LOGIC_VECTOR(to_unsigned(64,8));
                end if;
            when "1000" => -- Shift
                resultat <= STD_LOGIC_VECTOR(shift_left(unsigned(inp_a), to_integer(unsigned(inp_b))));
            when others =>
                display1 <= STD_LOGIC_VECTOR(to_unsigned(121, 8));
                display2 <= STD_LOGIC_VECTOR(to_unsigned(80, 8));
                display3 <= STD_LOGIC_VECTOR(to_unsigned(80, 8));
                resultat <= "00000";
        end case;
        
        out_alu <= resultat;
    end process;
end behaviour;
