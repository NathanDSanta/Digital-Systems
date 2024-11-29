library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    Port ( inp_a : in STD_LOGIC_VECTOR(4 downto 0);
           inp_b : in STD_LOGIC_VECTOR (4 downto 0);
           sel : in STD_LOGIC_VECTOR (3 downto 0);
           display1 : out STD_LOGIC_VECTOR(6 downto 0);
           display2 : out STD_LOGIC_VECTOR(6 downto 0);
           display3 : out STD_LOGIC_VECTOR(6 downto 0);
           display4 : out STD_LOGIC_VECTOR(6 downto 0);
           out_alu : out STD_LOGIC_VECTOR (9 downto 0));
end alu;

architecture behaviour of alu is
    signal A, B : unsigned (9 downto 0);
    signal resultat : STD_LOGIC_VECTOR (9 downto 0);
    signal temp : unsigned(9 downto 0);
begin
    process(inp_a, inp_b, sel)
    begin 
        -- Convertim els vectors en unsigned i els canviem la mida a 10
        A <= resize(unsigned(inp_a), 10); 
        B <= resize(unsigned(inp_b), 10);
        case sel is
            when "0001" => -- Comparacio
                resultat <= "0000000000";
                display4 <= "0000000";
                if (A < B) then -- A mes petit que B, per tant per pantalla mostrem "rg"
                    display1 <= "0000000";
                    display2 <= STD_LOGIC_VECTOR(to_unsigned(80, 7)); -- r
                    display3 <= STD_LOGIC_VECTOR(to_unsigned(111, 7)); -- g
                elsif (A = B) then  -- A igual que B, per tant mostrem "Eq"
                    display1 <= "0000000"; 
                    display2 <= STD_LOGIC_VECTOR(to_unsigned(121, 7)); -- E
                    display3 <= STD_LOGIC_VECTOR(to_unsigned(103, 7)); -- q
                else -- A mes gran que B, per tant mostrem "Lg"
                    display1 <= "0000000";  
                    display2 <= STD_LOGIC_VECTOR(to_unsigned(56, 7)); -- L
                    display3 <= STD_LOGIC_VECTOR(to_unsigned(111, 7)); -- g
                end if;
            when "0010" => -- Suma
                resultat <= STD_LOGIC_VECTOR(A + B);
                display1 <= "0000000";
                display2 <= "0000000";
                display3 <= "0000000";
            when "0100" => -- Resta
                temp <= A - B;
                display1 <= "0000000";
                display2 <= "0000000";
                display3 <= "0000000";
                if (temp < 0) then
                  display3 <= STD_LOGIC_VECTOR(to_unsigned(64,7));
                end if;
            when "1000" => -- Shift
                resultat <= STD_LOGIC_VECTOR(shift_left(A, to_integer(B)));
                display1 <= "0000000";
                display2 <= "0000000";
                display3 <= "0000000";
            when others => -- Si no hia una opcio valida selectionada mostrem "Err"
                display1 <= STD_LOGIC_VECTOR(to_unsigned(121, 7)); -- E
                display2 <= STD_LOGIC_VECTOR(to_unsigned(80, 7)); -- r
                display3 <= STD_LOGIC_VECTOR(to_unsigned(80, 7)); -- r
                resultat <= "0000000000";
        end case;
        
        out_alu <= resultat;
    end process;
end behaviour;
