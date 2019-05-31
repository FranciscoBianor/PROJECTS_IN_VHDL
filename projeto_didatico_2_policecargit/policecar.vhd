library ieee;
use ieee.std_logic_1164.all;

entity policecar is
port (CLK,BUT : in std_logic;
		LED1,LED2 : out std_logic);
end policecar;


architecture ckt of policecar is
begin 


LED1 <= ( BUT and (not CLK) );
LED2 <= ( BUT and CLK );

end ckt;