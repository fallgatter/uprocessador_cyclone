library ieee;
use ieee.std_logic_1164.all;

entity reg32 is
port(
	clk, rst: in std_logic;
	wren: in std_logic;
	data_in: in std_logic_vector(31 downto 0);
	data_out: out std_logic_vector(31 downto 0)
);
end entity;

architecture reg32_arch of reg32 is
signal data: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";

begin

process(clk, rst)
begin
	if(rst = '1') then
		data <= (others =>'0');
	elsif(clk'event and clk = '1') then
		if(wren = '1') then
			data <= data_in;
		end if;
	end if;
end process;
data_out <= data;

end architecture;
