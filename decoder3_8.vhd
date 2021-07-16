LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
ENTITY decoder3_8 IS
    PORT (
        a0, a1, a2, s1, s2, s3 : IN std_logic;
        f : OUT std_logic_vector(7 DOWNTO 0));
END decoder3_8;
ARCHITECTURE rtl OF decoder3_8 IS
    SIGNAL indata : std_logic_vector(2 DOWNTO 0);
BEGIN
    indata <= a0 & a1 & a2;
    PROCESS (indata, s1, s2, s3)
    BEGIN
        IF (s1 = '1'AND s2 = '0'AND s3 = '0') THEN
            CASE indata IS
                WHEN"000" => f <= "11111110";
                WHEN"001" => f <= "11111101";
                WHEN"010" => f <= "11111011";
                WHEN"011" => f <= "11110111";
                WHEN"100" => f <= "11101111";
                WHEN"101" => f <= "11011111";
                WHEN"110" => f <= "10111111";
                WHEN"111" => f <= "01111111";
                WHEN OTHERS => f <= "XXXXXXXX";
            END CASE;
        ELSE
            f <= "1111111";
        END IF;
    END PROCESS;
END rtl;