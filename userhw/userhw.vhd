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
	component processador is
		port(
			clk, reset : in std_logic;
			inst : in unsigned(16 downto 0) := (others => '0';
			state_now : out unsigned(1 downto 0) := (others => '0')	
		);
	component ram_ext is
		port(
			clk : in std_logic;
			endereco : in unsigned(6 downto 0);
			wr_en : in std_logic;
			dado_in : in unsigned(15 downto 0);
			dado_out : out unsigned(15 downto 0)
		);
		
	signal wren_c, wren_d : std_logic;

	signal con_out  : std_logic_vector(31 downto 0);
	signal data_d   : std_logic_vector(31 downto 0);
	signal data_out : std_logic_vector(31 downto 0);
	signal ram_data_out : std_logic_vector(16 downto 0);
	signal data_ready : std_logic := '0';
	signal current_state : std_logic_vector(1 downto 0);
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
	up : processador
		port map(
			clk => clk,
			reset => rst,
			inst => ram_data_out,
			state_now => current_state
		);
	ram : ram_ext
		port map(
			clk => clk,
			endereco => "0000000", -- Colocar PC aqui
			wr_en => '0', -- Tem que construir essa lógica aqui
			dado_in => data_d,
			dado_out => ram_data_out
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
