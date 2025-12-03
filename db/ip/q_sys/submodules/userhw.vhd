library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity userhw is
	port(
		clk, rst : in std_logic;
		read, write : in std_logic;
		address : in std_logic_vector(2 downto 0);
		writedata : in std_logic_vector(31 downto 0);
		readdata : out std_logic_vector(31 downto 0)
	);
end entity;

architecture userhw_arch of userhw is

	component reg32 is
		port(
			clk, rst : in std_logic;
			wren : in std_logic;
			data_in : in std_logic_vector(31 downto 0);
			data_out : out std_logic_vector(31 downto 0)
		);
	end component;

	signal wren_c, wren_d : std_logic;

	signal con_out  : std_logic_vector(31 downto 0);
	signal data_d   : std_logic_vector(31 downto 0);
	signal data_out : std_logic_vector(31 downto 0);

	signal data_ready : std_logic := '0';

begin

	wren_c <= '1' when (address = "000" and write = '1') else '0';
	wren_d <= '1' when (address = "001" and write = '1') else '0';

	con : reg32 --controle
		port map(
			clk => clk,
			rst => rst,
			wren => wren_c,
			data_in => writedata,
			data_out => con_out
		);

	reg_d : reg32 --dados
		port map(
			clk => clk,
			rst => rst,
			wren => wren_d,
			data_in => writedata,
			data_out => data_d
		);


	process(clk)
	begin
		if(rising_edge(clk)) then
			if(rst = '1') then
				data_out <= (others => '0');
				data_ready <= '0';
			elsif(data_ready = '1') then
				 data_ready <= '0';
			elsif(con_out(0) = '1' and data_ready = '0') then -- start
				 if data_d(7 downto 0) = x"F7" then
					  data_out <= x"00000000";
				 else
					  data_out <= (31 downto 8 => '0') & std_logic_vector(unsigned(data_d(7 downto 0))+1);
				 end if;
				 data_ready <= '1';
			end if;
		end if;
	end process;

	process(clk, read)
		begin
		if(rising_edge(clk)) then
			if(read = '1') then
				if(address = "010") then
					if(data_ready = '1') then
						readdata <= x"00000001";
					else
						readdata <= x"00000000";
					end if;
				elsif(address = "011") then
					readdata <= data_out;
				else
					readdata <= (others => 'Z');
				end if;
			end if;
		end if;
	end process;

end architecture;
