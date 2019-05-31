library ieee;
use ieee.std_logic_1164.all;

entity projetoflipflopd is 

	port (clk, clear, preset,entradad: in std_logic;
			q:out std_logic);
			
end projetoflipflopd;

architecture ckt of projetoflipflopd is 
	signal qs: std_logic;
begin 
	process (clk,preset,clear) 
	begin 
		if preset = '0' then qs <= '0';
		elsif clear = '0' then qs <= '0';
		elsif clk = '1' and clk'event then 
			qs<=entradad;
		end if;
	end process;
	q <= qs;
end ckt;
