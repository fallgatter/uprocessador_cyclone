LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY reg32_sc IS
PORT ( clock, resetn : IN STD_LOGIC;
   WE : IN STD_LOGIC;
	D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) );
END reg32_sc;

ARCHITECTURE Behavior OF reg32_sc IS
signal Q_tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
PROCESS(resetn, clock)
BEGIN
	IF resetn = '0' THEN
		Q_tmp <= x"00000000";
	elsif clock'EVENT AND clock = '1' then
		if WE = '1' then
			Q_tmp <= D;
		end if;	
		if Q_tmp(0) = '1' THEN
			Q_tmp(0) <= '0';
		end if;
		if Q_tmp(1) = '1' THEN
			Q_tmp(1) <= '0';
		end if;
	end if;
END PROCESS;
Q <= Q_tmp;
END Behavior;