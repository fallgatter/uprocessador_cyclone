library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rsa_tb is
end entity;

architecture arch_rsa_tb of rsa_tb is
component rsa is
    port (
        clk       : in  std_logic;
        rst       : in  std_logic;
        start     : in  std_logic;
		restart   : in  std_logic;	
        key       : in  std_logic_vector(31 downto 0);
        modulo    : in  std_logic_vector(31 downto 0);
        data_in   : in  std_logic_vector(31 downto 0);
        data_out  : out std_logic_vector(31 downto 0);
        done      : out std_logic
    );
end component;

signal clk, rst, data_ready: std_logic;
signal con_out, data_k, data_m, data_d, data_encrypt: std_logic_vector(31 downto 0);
begin

enc: rsa port map(clk=>clk, rst=>rst, start=>con_out(0), restart=>con_out(1), key=>data_k, modulo=>data_m, data_in=>data_d, data_out=>data_encrypt, done=>data_ready);


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
	data_k <= "00000000000000000000000000010001";
	data_m <= "00000000000000000000110010100001";
	data_d <= "00000000000000000000000001100001";
	wait for 10 ns;
	con_out <= "00000000000000000000000000000001";
	wait for 200 ns;
	con_out <= "00000000000000000000000000000010";
	wait for 10 ns;
	con_out <= "00000000000000000000000000000000";
	wait for 10 ns;
	con_out <= "00000000000000000000000000000001";
	wait;
end process;


end architecture;
