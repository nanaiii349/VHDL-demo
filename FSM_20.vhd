LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY gray IS
    PORT (
        s : IN std_logic_vector(2 DOWNTO 0);
        y : OUT std_logic_vector(2 DOWNTO 0));
END gray;

ARCHITECTURE rtl OF gray IS
    SIGNAL  state : std_logic_vector(2 DOWNTO 0);
BEGIN
    PROCESS (clk)
    BEGIN
        IF (clk' event AND clk = '0') THEN
            CASE state IS
                WHEN "000" => IF (y = 1) THEN
                    state <= "001";
                ELSE
                    state <= "100";
                END IF;
            WHEN "001" => IF (y = 1) THEN
                    state <= "011";
                ELSE
                    state <= "000";
                END IF;
            WHEN "011" => IF (y = 1) THEN
                    state <= "010";
                ELSE
                    state <= "011";
                END IF;
            WHEN "010" => IF (y = 1) THEN
                    state <= "110";
                ELSE
                    state <= "011";
                END IF;
            WHEN "110" =>IF (y = 1) THEN
                    state <= "111";
                ELSE
                    state <= "010";
                END IF;
            WHEN "111" => IF (y = 1) THEN
                    state <= "101";
                ELSE
                    state <= "110";
                END IF;
            WHEN "101" =>IF (y = 1) THEN
                    state <= "100";
                ELSE
                    state <= "111";
                END IF;
            WHEN "100"=> IF (y = 1) THEN
                    state <= "000";
                ELSE
                    state <= "101";
                END IF;
            END CASE;
        END IF;
    END PROCESS;
    y<=state;
END rtl; -- rtl