LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY store_controller IS PORT (
    k : IN std_logic;
    clk : IN std_logic;
    s : OUT std_logic_vector(1 DOWNTO 0));
END store_controller;
ARCHITECTURE rtl OF store_controller IS
    TYPE state_type IS(s0, s1, s2, s3);
    SIGNAL present_state, next_state : state_type;
    BEGINstate_register :
    PROCESS (clk)
    BEGIN
        IF (clk' event AND clk = '1') THEN
            present_state <= next_state;
        END IF;
    END PROCESS;
    output_logic : PROCESS (present_state) BEGINCASE present_state IS WHEN s0 => s <= "00";
        WHEN s1 => s <= "01";
        WHEN s2 => s <= "10";
        WHEN s3 => s <= "11";
    END CASE;
END PROCESS;
nextstate_logic : PROCESS (present_state, k) BEGIN
    CASE present_state IS
        WHEN s0 => IF (k = '0') THEN
            next_state <= s1;
        ELSE
            next_state <= present_state;
    END IF;
    WHEN s1 => IF (k = '1') THEN
    next_state <= s2;
ELSE
    next_state <= present_state;
END IF;
WHEN s2 => IF (k = '0') THEN
next_state <= s3;
ELSE
next_state <= present_state;
END IF;
WHEN s3 => IF (k = '1') THEN
next_state <= s0;
ELSE
next_state <= present_state;
END IF;
END CASE;
END PROCESS;
END rtl; -- rtl