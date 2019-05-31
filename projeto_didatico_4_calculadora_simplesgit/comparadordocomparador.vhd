library ieee;
use ieee.std_logic_1164.all;

entity comparadordocomparador is 
	port (A_COMP,B_COMP: in std_logic_vector (1 downto 0);
			A_COMP_menor_B_COMP , igual, A_COMP_maior_B_COMP : out std_logic);
end comparadordocomparador;

architecture ckt of comparadordocomparador is 

begin 

	A_COMP_menor_B_COMP <= '1' when A_COMP < B_COMP else '0' ;
	igual <= '1' when A_COMP = B_COMP else '0' ;
	A_COMP_maior_B_COMP <= '1' when A_COMP > B_COMP else '0' ;
	

end ckt;
