LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY mult IS
    PORT (
        A : IN std_logic_vector(7 DOWNTO 0);
        B : IN std_logic_vector(7 DOWNTO 0);
        Prod : OUT std_logic_vector(15 DOWNTO 0)
    );
END mult;

ARCHITECTURE multiplication OF mult IS
    SIGNAL ua : unsigned(15 DOWNTO 0);
    SIGNAL ub : unsigned(15 DOWNTO 0);
BEGIN
    Prod <= std_logic_vector(
        signed(A) * signed(B)
        );
END;