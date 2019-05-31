library ieee;
use ieee.std_logic_1164.all;



entity somar is
	port ( A , D , G , J : in std_logic ;
			R1 , R2 , COUT_SOMADOR : out std_logic);
			
end somar ;


architecture ckt of somar is
	

	component somadorbit_a_bit 
			port ( Cin, x, y : in std_logic ;
			 s , Cout : out std_logic );
	end component ;
	
	signal fio_cin_soma_DJ : std_logic;
	
begin 


	somador_bitD_bitJ : somadorbit_a_bit port map (Cin => '0' , x => D , y => J, Cout => fio_cin_soma_DJ , s => R2 );
	somador_bitA_bitG : somadorbit_a_bit port map (Cin => fio_cin_soma_DJ , x => A , y => G , Cout => COUT_SOMADOR , s => R1 );
	


end ckt;


