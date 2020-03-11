LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY fourbitaddersimple IS
    PORT (
        A, B : IN std_logic_vector(3 DOWNTO 0);
        Cin : IN std_logic := '0';
        A_out : OUT std_logic_vector(3 DOWNTO 0);
        B_out : OUT std_logic_vector(3 DOWNTO 0);
        SUM : OUT std_logic_vector(3 DOWNTO 0);
        Cout : OUT std_logic := '0');
END fourbitaddersimple;

-- Unsigned with Carry
ARCHITECTURE CarryImpl OF fourbitaddersimple IS

    SIGNAL ua : unsigned(4 DOWNTO 0);
    SIGNAL ub : unsigned(4 DOWNTO 0);
    SIGNAL uc : unsigned(4 DOWNTO 0);
    SIGNAL usum : unsigned(4 DOWNTO 0);

BEGIN
    A_out <= a;
    B_out <= b;
    ua <= resize(unsigned(a), 5);
    ub <= resize(unsigned(b), 5);
    uc <= (0 => Cin, OTHERS => '0');
    usum <= ua + ub + uc;
    Cout <= std_logic(usum(4));
    sum <= std_logic_vector(resize(usum, 4));
    -- sum <= std_logic_vector(usum);
END;

-- Unsigned 
ARCHITECTURE unsigned_impl OF fourbitaddersimple IS

    SIGNAL ua : unsigned(3 DOWNTO 0);
    SIGNAL ub : unsigned(3 DOWNTO 0);
    SIGNAL usum : unsigned(3 DOWNTO 0);
    -- 
BEGIN
    ua <= unsigned(a);
    ub <= unsigned(b);
    usum <= ua + ub;
    sum <= std_logic_vector(usum);

END;
-- Signed
ARCHITECTURE signed_impl OF fourbitaddersimple IS

    SIGNAL sa : signed(3 DOWNTO 0);
    SIGNAL sb : signed(3 DOWNTO 0);
    SIGNAL ssum : signed(3 DOWNTO 0);

BEGIN
    sa <= signed(a);
    sb <= signed(b);
    ssum <= sa + sb;
    sum <= std_logic_vector(ssum);
END;