library ieee;
use ieee.std_logic_1164.all;


entity conversorsetesegmentos is 

	port ( VA , VB , VC , VD : in std_logic ;
				A , B , C , D , E , F , G : out std_logic);
				
				
end conversorsetesegmentos ;


architecture ckt of conversorsetesegmentos is 

begin 



A <= (not   (VA or VC or ( VB and ( not VC ) and VD ) or ((not VA ) and (not VB) and (not VC) and (not VD))) ); 

B <= (not( VA or  ( VC and VD ) or ( VB and ( not VC ) and ( not VD )) or ( VD and ( not VA ) and ( not VB ) ) or ( VC and ( not VA ) and ( not VB ) ) or ((not VA ) and (not VB) and (not VC) and (not VD)) ) ) ;

C <= (not ( VA or  VB or ((not VA )   and VD ) or ((not VA ) and (not VB) and (not VC) and (not VD)))) ;

D <= (not  ( ( VA and VB ) or ( VC and ( not VD )) or  (  VA and VC ) or ( VC and ( not VA ) and( not VB )) or (VB and (not VC) and VD) or ( ( not VC ) and ( not VD ) and VA ) or ((not VA ) and (not VB) and (not VC) and (not VD)))) ;

E <= (not ( ( VA and VB ) or ( VA and ( not VC ) and ( not VD )) or ( VA and VC ) or ( VC and (not VD ))or ((not VA ) and (not VB) and (not VC) and (not VD)))) ;

F <= (not ( VA or ( VB and ( not VC)) or ( VB and VC and ( not VD))or ((not VA ) and (not VB) and (not VC) and (not VD)))) ;

G <= ( not ( VA or ( VC and ( not VA ) and ( not VB)) or ( VC and ( not VD ) ) or  ( ( not VC ) and VB)) );


end ckt;