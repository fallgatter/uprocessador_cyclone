library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity userhw_tb is
end entity;

architecture arch_userhw_tb of userhw_tb is
component userhw is
port(
	clk, rst: in std_logic;
	read, write: in std_logic;
	address: in std_logic_vector(2 downto 0);
	writedata: in std_logic_vector(31 downto 0);
	readdata: out std_logic_vector(31 downto 0)
);
end component;

signal clk, rst, read, write: std_logic;
signal address: std_logic_vector(2 downto 0);
signal writedata, readdata: std_logic_vector(31 downto 0);
begin

enc: userhw port map(clk=>clk, 
					rst=>rst, 
					read=>read,
					write=>write, 
					address=>address, 
					writedata=>writedata, 
					readdata=>readdata);


--clk
process
begin
	while true loop
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
	end loop;
end process;

--rst
process
begin
	rst <= '1';
	wait for 15 ns;
	rst <= '0';
	wait;
end process;

--data
process
begin
	wait for 15 ns;
	write <= '1';
	address <= "001";
	writedata <= "00000000000000000000000001100001";
	wait for 20 ns;
	address <= "010";
	writedata <= "00000000000000000000000000010001";
	wait for 20 ns;
	address <= "011";
	writedata <= "00000000000000000000110010100001";
	wait for 20 ns;
	address <= "000";
	writedata <= "00000000000000000000000000000001";
	wait for 20 ns;
	write <= '0';
	wait for 20 ns;
	address <= "101";
	read <= '1';
	wait for 200 ns;
	address <= "101";
	
	wait;
end process;


end architecture;
