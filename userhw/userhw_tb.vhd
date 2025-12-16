library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity userhw_tb is
end entity;

architecture tb of userhw_tb is

    -- DUT signals
    signal clk       : std_logic := '0';
    signal rst       : std_logic := '0';
    signal read      : std_logic := '0';
    signal write     : std_logic := '0';
    signal address   : std_logic_vector(2 downto 0) := (others => '0');
    signal writedata : std_logic_vector(31 downto 0) := (others => '0');
    signal readdata  : std_logic_vector(31 downto 0);

    -- Clock period
    constant CLK_PERIOD : time := 20 ns;

begin

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------
    dut : entity work.userhw
        port map (
            clk       => clk,
            rst       => rst,
            read      => read,
            write     => write,
            address   => address,
            writedata => writedata,
            readdata  => readdata
        );

    --------------------------------------------------------------------
    -- Clock generation
    --------------------------------------------------------------------
    clk <= not clk after CLK_PERIOD/2;

    --------------------------------------------------------------------
    -- Stimulus
    --------------------------------------------------------------------
    stim : process
    begin

        ----------------------------------------------------------------
        -- Reset
        ----------------------------------------------------------------
        rst <= '1';
        wait for 2*CLK_PERIOD;
        rst <= '0';
        wait for CLK_PERIOD;

        ----------------------------------------------------------------
        -- Configura controle:
        -- con_reg = "001"
        --  → con_reg(0)=1  => endereço da RAM vem de writedata(6 downto 0)
        ----------------------------------------------------------------
        address   <= "000";  -- con_reg
        writedata <= x"00000001";
        write     <= '1';
        wait for CLK_PERIOD;
        write     <= '0';
        wait for CLK_PERIOD;

        ----------------------------------------------------------------
        -- Escreve instrução 0 na RAM (endereço 0)
        -- B"0000000000_000_0001" -- LD R0,0
        ----------------------------------------------------------------
        address   <= "001";  -- data_reg
        writedata <= (31 downto 17 => '0') & "10000000010000001";
        write     <= '1';
        wait for CLK_PERIOD;
        write     <= '0';
        wait for CLK_PERIOD;

        address   <= "010";  -- RAM write
        writedata <= (31 downto 7 => '0') & "0000000"; -- endereço 0
        write     <= '1';
        wait for CLK_PERIOD;
        write     <= '0';
        wait for CLK_PERIOD;

----------------------------------------------------------------
-- Escrita de instruções LD na RAM
----------------------------------------------------------------

for i in 0 to 6 loop

    ----------------------------------------------------------------
    -- Escreve instrução no data_reg
    -- LD Ri, (7 - i)
    ----------------------------------------------------------------
    address <= "001";  -- data_reg
    writedata <=
        (31 downto 17 => '0') &
        std_logic_vector(to_unsigned(7 - i, 10)) & -- imediato
        std_logic_vector(to_unsigned(i, 3)) &      -- ddd (reg destino)
        "0001";                                    -- opcode LD
    write <= '1';
    wait for CLK_PERIOD;
    write <= '0';
    wait for CLK_PERIOD;

    ----------------------------------------------------------------
    -- Escreve a instrução na RAM (endereço i)
    ----------------------------------------------------------------
    address <= "010";  -- RAM write
    writedata <=
        (31 downto 7 => '0') &
        std_logic_vector(to_unsigned(i, 7)); -- endereço RAM
    write <= '1';
    wait for CLK_PERIOD;
    write <= '0';
    wait for CLK_PERIOD;

end loop;

        ----------------------------------------------------------------
        -- Modo STEP (con_reg = "011")
        ----------------------------------------------------------------
        address   <= "000";
        writedata <= x"00000003";
        write     <= '1';
        wait for CLK_PERIOD;
        write     <= '0';
        wait for CLK_PERIOD;

    ----------------------------------------------------------------
-- Executa todas as instruções via STEP
----------------------------------------------------------------
for i in 0 to 6 loop

    ----------------------------------------------------------------
    -- STEP
    ----------------------------------------------------------------
    address   <= "011";          -- step_reg
    writedata <= x"00000001";    -- step_reg(0) = 1
    write     <= '1';
    wait for CLK_PERIOD;
    write     <= '0';

    ----------------------------------------------------------------
    -- Tempo para a instrução executar
    ----------------------------------------------------------------
    wait for 10 * CLK_PERIOD;

end loop;
	
	
			for i in 0 to 6 loop

			 -- seleciona registrador i
			 address   <= "001"; -- data_reg
			 writedata <= std_logic_vector(to_unsigned(i, 32));
			 write     <= '1';
			 wait for CLK_PERIOD;
			 write     <= '0';
			 wait for CLK_PERIOD;

			 -- leitura
			 address <= "100";
			 read    <= '1';
			 wait for CLK_PERIOD;

			 -- debug (opcional)
			 report "Leitura REG" & integer'image(i) &
					  " = " & integer'image(to_integer(unsigned(readdata(15 downto 0))));

			 read <= '0';
			 wait for CLK_PERIOD;

		end loop;
        ----------------------------------------------------------------
        -- Fim
        ----------------------------------------------------------------
        wait for 10*CLK_PERIOD;
        assert false report "Fim da simulação (STEP)" severity failure;

    end process;

end architecture;
