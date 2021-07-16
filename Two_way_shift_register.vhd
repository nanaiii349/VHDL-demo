LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY shift_4 IS PORT (
    DSL, DSR, M : IN std_logic;
    cp : IN std_logic;
    d0 : OUT std_logic_vector(0 DOWNTO 3));
END shift_4;
ARCHITECTURE two_way_shift_reg OF shift_4 IS SIGNAL q_temp : std_logic_vector(0 DOWNTO 3);
BEGIN
    PROCESS (cp, M, DSL, DSR)
    BEGIN
        IF (cp' event AND cp = '1') THEN
            IF (M = '0') THEN
                q_temp <= DSR & q_temp(0) & q_temp(1) & q_temp(2);
            ELSIF (M = '1') THEN
                q_temp <= q_temp(1) & q_temp(2) & q_temp(3) & DSL;
            END IF;
        END IF;
    END PROCESS;
    d0 <= q_temp;
END two_way_shift_reg; -- two_way_shift_reg