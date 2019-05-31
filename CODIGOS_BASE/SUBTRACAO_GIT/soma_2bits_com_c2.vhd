library ieee;
use ieee.std_logic_1164.all;



entity soma_2bits_com_c2 is
	port ( B_SC2 , E_SC2 , HC2 , IC2 , Ci_C2 : in std_logic ;
			R1 , R2 , COUT_SOMADOR : out std_logic);
			
end soma_2bits_com_c2;


architecture ckt of soma_2bits_com_c2 is
	

	component somadorbit_a_bit 
			port ( Cin, x, y : in std_logic ;
			 s , Cout : out std_logic );
	end component ;
	
	signal fio_cin_soma_EI : std_logic;
	signal fio_cin_soma_BH : std_logic;
	
begin 


	somador_bitE_bitI : somadorbit_a_bit port map (Cin =>  '0' , x => E_SC2 , y => IC2 , Cout => fio_cin_soma_EI , s => R2 );
	somador_bitB_bitH : somadorbit_a_bit port map (Cin => fio_cin_soma_EI , x => B_SC2 , y => HC2 , Cout => fio_cin_soma_BH , s => R1 );
	somador_bitcin_bit0 : somadorbit_a_bit port map (Cin => fio_cin_soma_BH , x => Ci_C2 , y => '0' ,    s => COUT_SOMADOR );
	


end ckt;


