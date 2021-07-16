LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY BCDcode IS
    PORT (
        a : IN std_logic_vector(3 DOWNTO 0);
        b : OUT std_logic_vector(3 DOWNTO 0));
END BCDcode;
ARCHITECTURE converter OF BCDcode IS

    SIGNAL

BEGIN
    PROCESS (a)
    BEGIN
        b <= a + "0011";
    END PROCESS;

END converter; -- converter