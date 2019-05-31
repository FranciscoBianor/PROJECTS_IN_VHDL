library ieee;
use ieee.std_logic_1164.all;



entity SOMA_2BITS_COM_CA2_2BITS is
	port ( SOMA_B , SOMA_E , SOMA_HC2 , SOMA_IC2 , SOMA_CO_C2 : in std_logic ;
			R1 , R2 , R0: out std_logic);
			
end SOMA_2BITS_COM_CA2_2BITS;


architecture ckt of SOMA_2BITS_COM_CA2_2BITS is
	

	component somadorbit_a_bit 
			port ( Cin, x, y : in std_logic ;
			 s , Cout : out std_logic );
	end component ;
	
	signal fio_cin_soma_EI : std_logic;
	signal fio_cin_soma_BH : std_logic;
	
begin 


	somador_bitE_bitI : somadorbit_a_bit port map (Cin =>  '0' , x => SOMA_E , y => SOMA_IC2 , Cout => fio_cin_soma_EI , s => R2 );
	somador_bitB_bitH : somadorbit_a_bit port map (Cin => fio_cin_soma_EI , x => SOMA_B , y => SOMA_HC2 , Cout => fio_cin_soma_BH , s => R1 );
	somador_bitcin_bit0 : somadorbit_a_bit port map (Cin => fio_cin_soma_BH , x => SOMA_CO_C2 , y => '0' ,    s => R0 );
	


end ckt;


