LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY coder8_3 IS
    PORT (
        EI : IN std_logic;
        I : IN std_logic_vector(7 DOWNTO 0);
        Y : OUT std_logic_vector(2 DOWNTO 0);
        GS, EO : OUT std_logic
    );
END coder8_3;
ARCHITECTURE rtl OF coder8_3 IS

BEGIN
    PROCESS (EI, I)
    BEGIN
        IF (EI = '0') THEN
            IF (I(7) = '0') THEN
                Y <= "000";
                GS <= '0';
                EO <= '1';
            ELSIF (I(6) = '0') THEN
                Y <= "001";
                GS <= '0';
                EO <= '1';
            ELSIF (I(5) = '0') THEN
                Y <= "010";
                GS <= '0';
                EO <= '1';
            ELSIF (I(4) = '0') THEN
                Y <= "011";
                GS <= '0';
                EO <= '1';
            ELSIF (I(3) = '0') THEN
                Y <= "100";
                GS <= '0';
                EO <= '1';
            ELSIF (I(2) = '0') THEN
                Y <= "101";
                GS <= '0';
                EO <= '1';
            ELSIF (I(1) = '0') THEN
                Y <= "";
                GS <= '0';
                EO <= '1';
            ELSIF (I(0) = '0') THEN
                Y <= "111";
                GS <= '0';
                EO <= '1';
            ELSE
                Y <= "111";
                GS <= '1';
                EO <= '0';
            END IF;
        ELSE
            Y <= "111";
            GS <= '1';
            EO <= '1';
        END IF;
    END PROCESS;
END rtl;