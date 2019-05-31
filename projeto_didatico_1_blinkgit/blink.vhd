library ieee;
use ieee.std_logic_1164.all;

entity blink is 
port( BUT : in std_logic ;
		LED : out std_logic);
end blink;

architecture ckt of blink is 
signal FIO : std_logic; 
begin 
FIO <= BUT;
LED <= FIO;

end ckt;