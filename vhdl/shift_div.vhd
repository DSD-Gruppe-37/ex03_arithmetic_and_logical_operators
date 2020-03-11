LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY shift_div IS
    PORT (
        a : IN std_logic_vector(7 DOWNTO 0);
        a_shl, a_shr, a_ror : OUT std_logic_vector(7 DOWNTO 0)
    );
END shift_div;

ARCHITECTURE logicshift OF shift_div IS
BEGIN
    a_shl <= std_logic_vector(resize(unsigned(a) * 2, 8)); -- shiftes til venstre og begrænses til 8 pladser
    a_shr <= std_logic_vector(resize(unsigned(a) / 4, 8)); -- shiftes til højre med 2 og begrænses til 8 pladser
    a_ror <= a(2 DOWNTO 0) & a(7 DOWNTO 3); -- Rotere 3 til højre - plads er stadig 8.
END logicshift; -- logicshift