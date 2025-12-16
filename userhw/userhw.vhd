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
	COMPONENT reg32_sc IS
		PORT ( 
			clock, resetn : IN STD_LOGIC;
			WE : IN STD_LOGIC;
			D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
		);
	END COMPONENT;
	component processador is
		port(
			clk       : in std_logic;
			reset     : in std_logic;
			instr     : in unsigned(16 downto 0) := (others => '0');
			state_now : out unsigned (1 downto 0) := (others => '0');
			acum_data : out unsigned(15 downto 0) := x"0000";
			reg0_data : out unsigned(15 downto 0) := x"0000";
			reg1_data : out unsigned(15 downto 0) := x"0000";
			reg2_data : out unsigned(15 downto 0) := x"0000";
			reg3_data : out unsigned(15 downto 0) := x"0000";
			reg4_data : out unsigned(15 downto 0) := x"0000";
			reg5_data : out unsigned(15 downto 0) := x"0000";
			reg6_data : out unsigned(15 downto 0) := x"0000";
			pc_value  : out unsigned(6 downto 0)  := "0000000"
		);
	end component;
	component ram_ext is
		port(
			clk : in std_logic;
			endereco : in unsigned(6 downto 0);
			wr_en : in std_logic;
			dado_in : in unsigned(16 downto 0);
			dado_out : out unsigned(16 downto 0)
		);
	end component;
		
	signal wren_c, wren_d, wren_ram, wren_step, rst_n : std_logic;

	signal con_reg  : std_logic_vector(31 downto 0);
	signal data_reg   : std_logic_vector(31 downto 0);
	signal step_reg   : std_logic_vector(31 downto 0);
	signal data_out : std_logic_vector(31 downto 0);
	signal ram_data_out : unsigned(16 downto 0);
	signal data_ready : std_logic := '0';
	signal current_state : unsigned(1 downto 0);
	
	signal state_now : unsigned (1 downto 0) := (others => '0');
	signal instr     : unsigned(16 downto 0) := (others => '0');
	signal acum_data : unsigned(15 downto 0) := x"0000";
	signal reg0_data : unsigned(15 downto 0) := x"0000";
	signal reg1_data : unsigned(15 downto 0) := x"0000";
	signal reg2_data : unsigned(15 downto 0) := x"0000";
	signal reg3_data : unsigned(15 downto 0) := x"0000";
	signal reg4_data : unsigned(15 downto 0) := x"0000";
	signal reg5_data : unsigned(15 downto 0) := x"0000";
	signal reg6_data : unsigned(15 downto 0) := x"0000";
	signal pc_value, end_ram  : unsigned(6 downto 0)  := "0000000";
	signal clk_up, up_en	  : std_logic := '0';
	
begin

	con : reg32 --controle
		port map(
			clk => clk,
			rst => rst,
			wren => wren_c,
			data_in => writedata,
			data_out => con_reg
		);

	reg_d : reg32 --dados
		port map(
			clk => clk,
			rst => rst,
			wren => wren_d,
			data_in => writedata,
			data_out => data_reg
		);
		
	reg_step: reg32_sc
		port map(
			clock => clk,
			resetn => rst_n,
			WE => wren_step,
			D => writedata,
			Q => step_reg
		);
		
	up : processador
		port map(
			clk 		 => clk_up,
			reset     => rst,
			instr     => ram_data_out,
			state_now => current_state,
			acum_data => acum_data,
			reg0_data => reg0_data,
			reg1_data => reg1_data,
			reg2_data => reg2_data,
			reg3_data => reg3_data,
			reg4_data => reg4_data,
			reg5_data => reg5_data,
			reg6_data => reg6_data,
			pc_value  => pc_value
		);
		
	ram : ram_ext
		port map(
			clk => clk,
			endereco => end_ram, 
			wr_en => wren_ram, 
			dado_in => unsigned(data_reg(16 downto 0)),
			dado_out => ram_data_out
		);
		
	rst_n <= not rst;
		
	wren_c <= '1' when (address = "000" and write = '1') else 
				 '0';
				 
	wren_d <= '1' when (address = "001" and write = '1') else 
				 '0';
				 
	wren_ram <= '1' when (address = "010" and write = '1') else 
					'0';
					
	wren_step <= '1' when (address = "011" and write = '1') else
					 '0';
					
	end_ram <= unsigned(writedata(6 downto 0)) when con_reg(2) = '0' and con_reg(1) = '0' and con_reg(0) = '1' else
				  pc_value;-- when con_reg(2) = '0' and con_reg(1) = '1' and con_reg(0) = '0' else
				  --"0000000";
	
	clk_up <= clk and up_en;
	
	process(clk)
	begin
		if(rising_edge(clk)) then
			if((step_reg(0) = '1' and con_reg(2) = '0' and con_reg(1) = '1' and con_reg(0) = '1') or (con_reg(2) = '1' and con_reg(1) = '0' and con_reg(0) = '0')) then
				up_en <= '1';
			elsif(current_state = "10" and (con_reg(2) = '0' and con_reg(1) = '1' and con_reg(0) = '1')) then
				up_en <= '0';
			end if;
		end if;
	end process;
	
	process(clk)
		begin
			if(rising_edge(clk)) then
				if(read = '1') then
					if(address = "100") then
						case data_reg(2 downto 0) is
							when "000" =>
								readdata <= (31 downto 16 => reg0_data(15)) & std_logic_vector(reg0_data);
							when "001" =>
								readdata <= (31 downto 16 => reg0_data(15)) & std_logic_vector(reg1_data);
							when "010" =>
								readdata <= (31 downto 16 => reg0_data(15)) & std_logic_vector(reg2_data);
							when "011" =>
								readdata <= (31 downto 16 => reg0_data(15)) & std_logic_vector(reg3_data);
							when "100" =>
								readdata <= (31 downto 16 => reg0_data(15)) & std_logic_vector(reg4_data);
							when "101" =>
								readdata <= (31 downto 16 => reg0_data(15)) & std_logic_vector(reg5_data);
							when "110" =>
								readdata <= (31 downto 16 => reg0_data(15)) & std_logic_vector(reg6_data);
							when others =>
								readdata <= (others => '0');
						end case;
					elsif(address = "101") then
						readdata <= (31 downto 1 => '0') & up_en;
					else
						readdata <= (others => '0');
					
					end if;
				end if;
			end if;
	end process;

end architecture;
