LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY dff IS PORT (
    d : IN std_logic;
    clk : IN std_logic;
    q : OUT std_logic);
END dff;
ARCHITECTURE rtl1 OF dff IS BEGIN
    PROCESS (clk) BEGIN
        IF (clk' event AND clk = '1') THEN
            q <= d;
        END IF;
    END PROCESS;
END rtl1;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY shift_reg IS PORT (
    d1 : IN std_logic;
    cp : IN std_logic;
    d0 : OUT std_logic_vector(3 DOWNTO 0));
END shift_reg;
ARCHITECTURE rtl2 OF shift_reg IS
    COMPONENT dff PORT (
        d : IN std_logic;
        clk : IN std_logic;
        q : OUT std_logic);
    END COMPONENT;
    SIGNAL q_temp : std_logic_vector(4 DOWNTO 1);
BEGIN
    G1 : FOR i IN 0 TO 3 GENERATE
        P1 : IF (i = 0)GENERATE 
        dffx : dff PORT MAP(d1, cp, q_temp(i + 1));
        END GENERATE P1;
        P2 : IF (i /= 0)GENERATE 
        dffx : dff PORT MAP(q_temp(i), cp, q_temp(i + 1));
        END GENERATE P2;
    END GENERATE G1;
    d0 <= q_temp(4 DOWNTO 1);
END rtl2;