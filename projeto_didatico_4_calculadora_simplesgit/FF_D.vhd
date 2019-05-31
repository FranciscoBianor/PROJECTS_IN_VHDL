library ieee;
use ieee.std_logic_1164.all;

entity FF_D is 

	port (clk, cle, pre,entradad: in std_logic;
			q:out std_logic);
			
end FF_D;

architecture ckt of FF_D is 
	signal qs: std_logic;
begin 
	process (clk,pre,cle)
	begin 
		if pre = '0' then qs <= '0';
		elsif cle = '0' then qs <= '0';
		elsif clk = '1' and clk'event then 
			qs<=entradad;
		end if;
	end process;
	q <= qs;
end ckt;

