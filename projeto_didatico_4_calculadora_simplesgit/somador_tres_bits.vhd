library ieee;
use ieee.std_logic_1164.all;



entity somador_tres_bits is
	port ( T6_SOMADOR , T5_SOMADOR , T4_SOMADOR: in std_logic ;
			RF1 , RF2 , RF3 , COUT_SOMADOR : out std_logic);
			
end somador_tres_bits;


architecture ckt of somador_tres_bits is
	

	component somadorbit_a_bit 
			port ( Cin, x, y : in std_logic ;
			 s , Cout : out std_logic );
	end component ;
	
	signal fio_cin_soma_T61 : std_logic ;
	signal fio_cin_soma_T51 : std_logic ;
	
begin 


	somador_bitT6_bit1 : somadorbit_a_bit port map ( Cin => '0' , x => T6_SOMADOR , y => '1' , Cout => fio_cin_soma_T61 , s => RF3 );
	somador_bitT5_bit0 : somadorbit_a_bit port map (Cin => fio_cin_soma_T61 , x => T5_SOMADOR , y => '0' , Cout => fio_cin_soma_T51 , s => RF2 );
	somador_bitT4_bit0 : somadorbit_a_bit port map (Cin =>  fio_cin_soma_T51 , x => T4_SOMADOR , y => '0' , Cout => COUT_SOMADOR , s => RF1 );



end ckt;


