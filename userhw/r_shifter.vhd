library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity r_shifter is
    port(
        i_n        : in unsigned(15 downto 0);
        shift_n    : in unsigned(4 downto 0);
        shifted    : out unsigned(15 downto 0)
    );
end entity;

architecture a_r_shifter of r_shifter is
begin
    shifted <= (others => '0') 
					when to_integer(shift_n) >= 16 else
					i_n srl to_integer(shift_n);
end architecture;