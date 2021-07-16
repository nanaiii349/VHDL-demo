LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY counter IS
    PORT (
        clk, areset, sset, enable : IN std_logic;
        cout : OUT std_logic;
        q : BUFFER std_logic_vector(3 DOWNTO 0));
END counter;

ARCHITECTURE rtl OF counter IS

BEGIN
    PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            q <= '0000';
        ELSIF (clk' event AND clk = '1') THEN
            IF (sset = '1') THEN
                q <= 0110;
            ELSIF (enable = '1') THEN
                q <= q + 1;
            ELSE
                q <= q;
            END IF;
        END IF;
    END PROCESS;
    cout <= '1'WHEN q = '1111' AND enable = '1'
        ELSE
        '0';
END rtl;
- counter