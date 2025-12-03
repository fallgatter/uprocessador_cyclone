library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity userhw is
port(
	clk, rst: in std_logic;
	read, write: in std_logic;
	address: in std_logic_vector(2 downto 0);
	writedata: in std_logic_vector(31 downto 0);
	readdata: out std_logic_vector(31 downto 0)
);
end entity;

architecture userhw_arch of userhw is
component reg32 is
port(
	clk, rst: in std_logic;
	wren: in std_logic;
	data_in: in std_logic_vector(31 downto 0);
	data_out: out std_logic_vector(31 downto 0)
);
end component;

component xtea_core is
    port (
        clk       : in  std_logic;
        rst       : in  std_logic;
        start     : in  std_logic;
        key       : in  std_logic_vector(127 downto 0);
        data_in   : in  std_logic_vector(63 downto 0);
        data_out  : out std_logic_vector(63 downto 0);
        done      : out std_logic
    );
end component;

signal con_out: std_logic_vector(31 downto 0);
signal data_d: std_logic_vector(63 downto 0);
signal data_k: std_logic_vector(127 downto 0);

signal data_encrypt: std_logic_vector(63 downto 0);
signal data_ready: std_logic;

signal wren_c: std_logic;
signal wren_d1, wren_d2: std_logic;
signal wren_k1, wren_k2, wren_k3, wren_k4: std_logic;

begin

con: reg32 port map(clk=>clk, rst=>rst, wren=>wren_c, data_in=>writedata, data_out=>con_out);

reg_d1: reg32 port map(clk=>clk, rst=>rst, wren=>wren_d1, data_in=>writedata, data_out=>data_d(31 downto 0));
reg_d2: reg32 port map(clk=>clk, rst=>rst, wren=>wren_d2, data_in=>writedata, data_out=>data_d(63 downto 32));

reg_k1: reg32 port map(clk=>clk, rst=>rst, wren=>wren_k1, data_in=>writedata, data_out=>data_k(31 downto 0));
reg_k2: reg32 port map(clk=>clk, rst=>rst, wren=>wren_k2, data_in=>writedata, data_out=>data_k(63 downto 32));
reg_k3: reg32 port map(clk=>clk, rst=>rst, wren=>wren_k3, data_in=>writedata, data_out=>data_k(95 downto 64));
reg_k4: reg32 port map(clk=>clk, rst=>rst, wren=>wren_k4, data_in=>writedata, data_out=>data_k(127 downto 96));

enc: xtea_core port map(clk=>clk, rst=>rst, start=>con_out(0), key=>data_k, data_in=>data_d, data_out=>data_encrypt, done=>data_ready);


wren_c <= '1' when (address = "000" and write = '1') else '0';

wren_d1 <= '1' when (address = "001" and write = '1') else '0';
wren_d2 <= '1' when (address = "010" and write = '1') else '0';

wren_k1 <= '1' when (address = "011" and write = '1') else '0';
wren_k2 <= '1' when (address = "100" and write = '1') else '0';
wren_k3 <= '1' when (address = "101" and write = '1') else '0';
wren_k4 <= '1' when (address = "110" and write = '1') else '0';


process(clk, read)
begin
	if(clk'event and clk = '1') then
		if(read = '1') then
			if(address = "000") then
				readdata <= "0000000000000000000000000000000" & data_ready;
			elsif(address = "001") then
				readdata <= data_encrypt(31 downto 0);
			elsif(address = "010") then
				readdata <= data_encrypt(63 downto 32);
			end if;
		end if;
	end if;
end process;

end architecture;
