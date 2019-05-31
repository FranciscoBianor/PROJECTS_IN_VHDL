library ieee;
use ieee.std_logic_1164.all ;



entity ca2 is
 port ( H_C2, I_C2  : in std_logic;
		 SAIDA_H_C2 , SAIDA_I_C2 , COUT_SOMADOR_C2 : out std_logic);
end ca2;




architecture ckt of ca2 is



	component somador_dois_bits 
		port ( H_SOMADOR , I_SOMADOR: in std_logic ;
				R1 , R2 , COUT_SOMADOR : out std_logic);
				
	end component ;
	
	signal not_H_C2	, not_I_C2 : std_logic ;
	 
	begin


	not_H_C2 <= ( not H_C2 );
	not_I_C2 <= ( not I_C2 );

	SOMAR : somador_dois_bits port map ( H_SOMADOR => not_H_C2 , I_SOMADOR => not_I_C2 , R1 => SAIDA_H_C2 , R2 => SAIDA_I_C2 , COUT_SOMADOR => COUT_SOMADOR_C2 );


end ckt;




