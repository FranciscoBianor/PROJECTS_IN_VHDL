library ieee;
use ieee.std_logic_1164.all;


entity maquina_de_estado is

	port (CLK_G , RESET ,  PRESET_G : in std_logic;
			SAIDA : out std_logic_vector (2 downto 0));
			
end maquina_de_estado;


architecture ckt of maquina_de_estado is 

	component projetoflipflopd  
		port (clk, clear, preset,entradad: in std_logic;
				q:out std_logic);
	end component;
	
	signal a,b,c: std_logic;
	signal entrada_a,entrada_b,entrada_c: std_logic ;
	signal saida_a,saida_b,saida_c: std_logic ;


begin 

	
		
		entrada_a <= ((b and c) or (a and (not c)));
		entrada_b <= ((b and (not c)) or (a and b) or ((not a) and (not b) and c)) ;
		entrada_c <= ((not c) or (a and b));
		
		flipflopd_a: projetoflipflopd port map (  clk => CLK_G , clear => RESET , preset => PRESET_G ,  entradad => entrada_a , q => a );
		flipflopd_b: projetoflipflopd port map (  clk => CLK_G , clear => RESET , preset => PRESET_G ,  entradad => entrada_b , q => b )  ;
		flipflopd_c: projetoflipflopd port map (  clk => CLK_G , clear => RESET , preset => PRESET_G ,  entradad => entrada_c , q => c ) ;

		SAIDA(2) <= a;
		SAIDA(1) <= b;
		SAIDA(0) <= c;
end ckt;

