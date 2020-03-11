LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;

-- SUBTYPE std_logic IS resolved std_ulogic;

-- Sådan undgår man hazard...  
ENTITY resolutiontest IS
    PORT (
        a, b : IN std_logic;
        c : OUT std_logic);
END resolutiontest;

ARCHITECTURE behavorial OF resolutiontest IS

    SUBTYPE std_logic IS resolved std_ulogic;

BEGIN
    PROCESS (a, b)
    BEGIN
        IF a = '1' THEN
            c <= '1';
        ELSE
            c <= 'Z';
        END IF;
    END PROCESS; -- 

    PROCESS (a, b)
    BEGIN
        IF a = '0' THEN
            c <= '0';
        ELSE
            c <= 'Z';
        END IF;
    END PROCESS;
END behavorial; -- behavorial