library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rsa is
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
end entity;

architecture arch_rsa of rsa is
	type STATES is (INIT, BINEXP, MODUL, FIN1, FIN2);
   signal state  : STATES;
	
	signal u_power, u_modulo, u_ans, u_mult: unsigned(31 downto 0);
	begin

   process(clk, rst)
	begin
		if(rst = '1') then
			u_power <= (others => '0');
			u_modulo <= (others => '0');
			u_ans <= (others => '0');
			u_mult <= (others => '0');
			done <= '0';
         state <= INIT;
      elsif(clk'event and clk = '1') then
         case state is
				when INIT =>
					u_power <= unsigned(key);
					u_modulo <= unsigned(modulo);
					u_ans <= "00000000000000000000000000000001";
					u_mult <= unsigned(data_in);
					done <= '0';
					if(start = '1') then
                  state <= BINEXP;
               end if;
            when BINEXP =>
               if(u_power > 0) then
						if(u_power(0) = '1') then
							u_ans <= unsigned(u_ans * u_mult)(31 downto 0);
						end if;
						u_mult <= unsigned(u_mult * u_mult)(31 downto 0);
						u_power <= "0" & u_power(31 downto 1);
						state <= MODUL;
					else
                  state <= FIN1;
               end if;
				when MODUL =>
					if(u_ans >= u_modulo) then
						u_ans <= u_ans - u_modulo;
					end if;
					if(u_mult >= u_modulo) then
						u_mult <= u_mult - u_modulo;
					end if;
					if(u_ans < u_modulo and u_mult < u_modulo) then
						state <= BINEXP;
					end if;
            when FIN1 =>
               data_out <= std_logic_vector(u_ans);
               state <= FIN2;
            when FIN2 =>
               done <= '1';
               if(restart = '1') then
						state <= INIT;
					end if;
				end case;
		end if;
	end process;

end architecture;
