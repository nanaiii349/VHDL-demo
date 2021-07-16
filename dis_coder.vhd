LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
ENTITY dis_coder IS
  PORT (
    IT, RBI : IN std_logic;
    A : IN std_logic_vector(3 DOWNTO 0);
    a, b, c, d, e, f, g : OUT std_logic;
    BIRBO : INOUT std_logic
  );
END dis_coder;
ARCHITECTURE rtl OF dis_coder IS
  SIGNAL outdata : std_logic_vector(6 DOWNTO 0)
BEGIN
  outdata <= a & b & c & d & e & f & g;
  PROCESS (A, LT, RBI, BIRBO)
  BEGIN
    IF (BIRBO = '0') THEN
      outdata <= "0000000"
        ELSE
        IF (LT = '0') THEN
          outdata <= "11111111";
          BIRBO <= '1';
        ELSE
          IF (RBI = '0'AND A = "0000") THEN
            outdata <= "0000000";
            BIRBO <= '0';
          ELSIF (RBI = '1'AND a = "0000") THEN
            outdata <= "1111110";
            BIRBO <= '1';
          ELSIF (A = "0001") THEN
            outdata <= "0110000";
            BIRBO <= '1';
          ELSIF (A = "0010") THEN
            outdata <= "1101101";
            BIRBO <= '1';
          ELSIF (A = "0011") THEN
            outdata <= "1111001";
            BIRBO <= '1';
          ELSIF (A = "0100") THEN
            outdata <= "0110011";
            BIRBO <= '1';
          ELSIF (A = "0101") THEN
            outdata <= "1011011";
            BIRBO <= '1';
          ELSIF (A = "0110") THEN
            outdata <= "0011111";
            BIRBO <= '1';
          ELSIF (A = "0111") THEN
            outdata <= "1110000";
            BIRBO <= '1';
          ELSIF (A = 1000) THEN
            outdata <= "1111111";
            BIRBO <= '1';
          ELSIF (A = "1001") THEN
            outdata <= "1110011";
            BIRBO <= '1';
          ELSE
            outdata <= "0000000";
            BIRBO <= '1';
        END IF;
      END IF;
    END IF;
  END PROCESS;
END rtl;