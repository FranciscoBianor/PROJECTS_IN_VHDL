library ieee;
use ieee.std_logic_1164.all ;



entity ca2_3 is
 port ( T6_C2 , T5_C2 , T4_C2 : in std_logic;
		 SAIDA_RF1 , SAIDA_RF2 , SAIDA_RF3 : out std_logic);
end ca2_3;




architecture ckt of ca2_3 is



	component somador_tres_bits 
	port ( T6_SOMADOR , T5_SOMADOR , T4_SOMADOR : in std_logic ;
			RF1 , RF2 , RF3 , COUT_SOMADOR : out std_logic);
			
	end component ;

	signal not_T4	, not_T5 , not_T6 : std_logic ;
	
	begin
	
	not_T4 <= (not T4_C2);
	not_T5 <= (not T5_C2);
	not_T6 <= (not T6_C2);

	

	SOMAR : somador_tres_bits port map (  T6_SOMADOR => not_T6 , T5_SOMADOR => not_T5 , T4_SOMADOR => not_T4 , RF1 => SAIDA_RF1 , RF2 => SAIDA_RF2 , RF3 => SAIDA_RF3 );


end ckt;




