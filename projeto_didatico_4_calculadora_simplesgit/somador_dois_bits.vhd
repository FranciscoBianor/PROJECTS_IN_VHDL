library ieee;
use ieee.std_logic_1164.all;



entity somador_dois_bits is
	port ( H_SOMADOR , I_SOMADOR : in std_logic ;
			R1 , R2 , COUT_SOMADOR : out std_logic);
			
end somador_dois_bits;


architecture ckt of somador_dois_bits is
	

	component somadorbit_a_bit 
			port ( Cin, x, y : in std_logic ;
			 s , Cout : out std_logic );
	end component ;
	
	signal fio_cin_soma_H1 : std_logic;
	
begin 


	somador_bitI_bit1 : somadorbit_a_bit port map ( Cin => '0' , x => I_SOMADOR , y => '1' , Cout => fio_cin_soma_H1 , s => R2 );
	somador_bitH_bit0 : somadorbit_a_bit port map (Cin => fio_cin_soma_H1 , x => H_SOMADOR , y => '0' , Cout => COUT_SOMADOR , s => R1 );
	


end ckt;


