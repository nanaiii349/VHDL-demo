LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY counter_60 IS
	PORT (
		clr, en, cp : IN std_logic;
		QH, QL : OUT std_logic_vector(3 DOWNTO 0));
END counter_60;
ARCHITECTURE rtl OF counter_60 IS
	SIGNAL qh_temp, ql_temp : std_logic_vector(3 DOWNTO 0);
BEGIN
	PROCESS (clr, en, cp)
	BEGIN
		IF (clr = '0') THEN
			qh_temp <= "0101";
			ql_temp <= "0101";
		ELSIF (cp' event AND cp = '1') THEN
			IF (en = '1') THEN
				IF (ql_temp = "1001") THEN
					ql_temp <= "0000";
					qh_temp <= qh_temp + 1;
				ELSE
					ql_temp <= ql_temp + 1;
				END IF;
				IF ((qh_temp = 5) AND (ql_temp = 9)) THEN
					qh_temp <= "0000";
				END IF;
			END IF;
		END IF;
	END PROCESS;
	QH <= qh_temp;
	Ql <= ql_temp;
END rtl;