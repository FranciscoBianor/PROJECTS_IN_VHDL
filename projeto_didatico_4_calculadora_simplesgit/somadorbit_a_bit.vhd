library ieee ;
use ieee.std_logic_1164.all ;

entity somadorbit_a_bit is
	port ( Cin, x, y : in std_logic ;
			 s , Cout : out std_logic );
end somadorbit_a_bit ;

architecture ckt of somadorbit_a_bit is

	begin

	s <= (x xor y xor Cin) ;
	Cout <= ((x and y) or (Cin and x) OR (Cin and y)) ;

end ckt ;