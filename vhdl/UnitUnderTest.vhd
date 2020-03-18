LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;

ENTITY UnitUnderTest IS
    PORT (
        SW : IN std_logic_vector(17 DOWNTO 0);
        HEX0 : OUT std_logic_vector(6 DOWNTO 0);
        HEX1 : OUT std_logic_vector(6 DOWNTO 0);
        HEX2 : OUT std_logic_vector(6 DOWNTO 0);
        HEX3 : OUT std_logic_vector(6 DOWNTO 0);
        HEX4 : OUT std_logic_vector(6 DOWNTO 0);
        HEX5 : OUT std_logic_vector(6 DOWNTO 0);
        HEX6 : OUT std_logic_vector(6 DOWNTO 0);
        LEDR : OUT std_logic_vector(17 DOWNTO 0);
        LEDG : OUT std_logic_vector(7 DOWNTO 0));
END;

ARCHITECTURE structural OF UnitUnderTest IS
BEGIN
    UUT0 : ENTITY fourbitaddersimple(CarryImpl)
        PORT MAP
        (
            -- INPUTS
            A(3 DOWNTO 0) => SW(3 DOWNTO 0),
            B(3 DOWNTO 0) => SW(7 DOWNTO 4),
            Cin => SW(17),
            -- OUTPUTS
            A_out(3 DOWNTO 0) => LEDR(3 DOWNTO 0),
            B_out(3 DOWNTO 0) => LEDR(7 DOWNTO 4),
            SUM(3 DOWNTO 0) => LEDG(3 DOWNTO 0),
            Cout => LEDG(4)
        );

    UUT1 : ENTITY fourbitaddersimple(signed_impl)
        PORT MAP
        (
            -- INPUTS
            A(3 DOWNTO 0) => SW(3 DOWNTO 0),
            B(3 DOWNTO 0) => SW(7 DOWNTO 4),
            -- OUTPUTS
            A_out(3 DOWNTO 0) => HEX0(3 DOWNTO 0),
            B_out(3 DOWNTO 0) => HEX1(3 DOWNTO 0),
            SUM(3 DOWNTO 0) => HEX4(3 DOWNTO 0)
        );

    UUT2 : ENTITY fourbitaddersimple(unsigned_impl)
        PORT MAP
        (
            -- INPUTS
            A(3 DOWNTO 0) => SW(3 DOWNTO 0),
            B(3 DOWNTO 0) => SW(7 DOWNTO 4),
            -- OUTPUTS
            A_out(3 DOWNTO 0) => HEX3(3 DOWNTO 0),
            B_out(3 DOWNTO 0) => HEX6(3 DOWNTO 0),
            SUM(3 DOWNTO 0) => HEX5(3 DOWNTO 0)
        );

    UUT3 : ENTITY shift_div(logicshift)

        PORT MAP
        (
            -- INPUTS
            A(7 DOWNTO 0) => SW(7 DOWNTO 0),
            -- OUTPUTS
            A_shl(7 DOWNTO 0) => LEDR(17 DOWNTO 10),
            A_shr(7 DOWNTO 0) => LEDR(7 DOWNTO 0),
            A_ror(7 DOWNTO 0) => LEDG(7 DOWNTO 0)

        );

    UUT4 : ENTITY mult
        PORT MAP
        (
            -- INPUTS
            A(7 DOWNTO 0) => SW(7 DOWNTO 0),
            B(7 DOWNTO 0) => SW(15 DOWNTO 8),
            -- OUTPUTS
            Prod(15 DOWNTO 0) => LEDR(15 DOWNTO 0)
        );
END;