library ieee;
use ieee.std_logic_1164.all;


entity led_sequecia is 
	port ( BUT , CLK_LED , PRESET_LED : in std_logic ;
			LED1 , LED2 , LED3 , LED4 , LED5 : out std_logic );
			
end led_sequecia ;


architecture ckt of led_sequecia is 
	
	component maquina_de_estado 

		port (CLK_G , RESET ,  PRESET_G : in std_logic;
				SAIDA : out std_logic_vector (2 downto 0));
			
	end component;
	
	
	signal s_maq : std_logic_vector (2 downto 0);
	
begin 
	
	

	led_sequencia_1 : maquina_de_estado port map( CLK_G => CLK_LED , RESET => BUT , PRESET_G => PRESET_LED  , SAIDA => s_maq); 
	
	
	LED1 <= ( s_maq(0) or s_maq(1) or s_maq(2));
	LED2 <= (s_maq(1) or s_maq(2));
	LED3 <= (s_maq(2) or (s_maq(1) and s_maq(0)));
	LED4 <= s_maq(2);
	LED5<= ( (s_maq(2) and  s_maq(1)) or  (s_maq(2) and s_maq(0)));

end ckt ;