library ieee;
use ieee.std_logic_1164.all;

entity didatico4 is 
 
	port ( VALOR1 , VALOR2 , VALOR3 , VALOR4 , BUTCARREGUE , BUTSOME , BUTSUBTRAIA , BUTCOMPARE  , CLKGERAL: in std_logic ;
			DISPLAY1 , DISPLAY2  : out std_logic_vector(6 downto 0);
			DISPLAYMAIOR , DISPLAYIGUAL , DISPLAYMENOR : out std_logic;
			DISPLAY2NEGATIVO : out std_logic ;
			APAGANDOLEDSAOREDORDONEGATIVO : out std_logic_vector(5 downto 0));
			
end didatico4;




architecture ckt of didatico4 is 


	component selecao_entradaa  
		port (VAL_B1 , VAL_B2 , VAL_B3 , VAL_B4 , LOAD , BUT_LOAD_SOMA , BUT_LOAD_SUBTRARIR , BUT_LOAD_COMPARAR , GND , CLK_SELECAO : in std_logic ;
				A_LOAD , D_LOAD , G_LOAD , J_LOAD , B_LOAD  , E_LOAD , H_LOAD , K_LOAD , C_LOAD  ,F_LOAD , I_LOAD , L_LOAD : out std_logic);
	end component ;
	
	
	component somar 
		port ( A , D , G , J : in std_logic ;
				R1 , R2 , COUT_SOMADOR : out std_logic);
	end component ;
	
	
	component subtracao 
		port ( BSUB , ESUB , HSUB , ISUB , CLKSUB : in std_logic ;
				DISPLAY_NEGATIVO , DISPLAY_VALOR1 , DISPLAY_VALOR2 , DISPLAY_VALOR3  : out std_logic );
	end component ;
	
	component comparadordocomparador 
		port (A_COMP,B_COMP: in std_logic_vector (1 downto 0);
				A_COMP_menor_B_COMP , igual, A_COMP_maior_B_COMP : out std_logic);
	end component;
	
	component conversorsetesegmentos 
		port ( VA , VB , VC , VD : in std_logic ;
					A , B , C , D , E , F , G : out std_logic);
	end component ;

	
	signal BLOCO1 , BLOCO2 , BLOCO3 , BLOCO4 , BLOCO5 , BLOCO6 , BLOCO7 , BLOCO8 , BLOCO9 , BLOCO10 , BLOCO11 , BLOCO12 : std_logic ;
	signal SAIDAR2 , SAIDAR1 , SAIDACOUT : std_logic ;
	signal SAIDAR3 , SAIDAR4 : std_logic ;
	signal DISPLAY1NEGATIVO : std_logic ;
begin 


selecaodeentrada : selecao_entradaa port map ( VAL_B1 => VALOR1 , VAL_B2 => VALOR2 , VAL_B3 => VALOR3 , VAL_B4 => VALOR4 , LOAD => BUTCARREGUE , BUT_LOAD_SOMA => BUTSOME , BUT_LOAD_SUBTRARIR => BUTSUBTRAIA , BUT_LOAD_COMPARAR => BUTCOMPARE  , GND => '0' , CLK_SELECAO => CLKGERAL , A_LOAD => BLOCO1 , D_LOAD  => BLOCO2 , G_LOAD  => BLOCO3 , J_LOAD  => BLOCO4 , B_LOAD => BLOCO5  , E_LOAD => BLOCO6 , H_LOAD => BLOCO7 , K_LOAD => BLOCO8 , C_LOAD => BLOCO9  ,F_LOAD => BLOCO10 , I_LOAD => BLOCO11 , L_LOAD => BLOCO12 ) ;  
somandovalores : somar port map ( A => BLOCO1 , D => BLOCO2 , G => BLOCO3 , J => BLOCO4 , R1 => SAIDAR1 , R2 => SAIDAR2 , COUT_SOMADOR => SAIDACOUT ) ;
subtraindovalores : subtracao port map ( BSUB => BLOCO5 , ESUB => BLOCO6 , HSUB => BLOCO7 , ISUB => BLOCO8 , CLKSUB => CLKGERAL , DISPLAY_NEGATIVO => DISPLAY1NEGATIVO ,  DISPLAY_VALOR2 => SAIDAR3 , DISPLAY_VALOR3 => SAIDAR4 );
comparando : comparadordocomparador port map ( A_COMP(1) => BLOCO9 , A_COMP(0)=> BLOCO10 , B_COMP(1)=> BLOCO11 , B_COMP(0)=> BLOCO12 , A_COMP_menor_B_COMP => DISPLAYMENOR , igual => DISPLAYIGUAL , A_COMP_maior_B_COMP => DISPLAYMAIOR );
saidadisplaydasoma : conversorsetesegmentos port map ( VA => '0' , VB => SAIDACOUT , VC => SAIDAR1 , VD => SAIDAR2 , A => DISPLAY1 (0) , B => DISPLAY1 (1) , C => DISPLAY1 (2) , D => DISPLAY1 (3) , E => DISPLAY1 (4) , F => DISPLAY1 (5) , G => DISPLAY1 (6) );
saidadisplaysubtracao : conversorsetesegmentos port map ( VA => '0' , VB => '0' , VC => SAIDAR3 , VD => SAIDAR4 ,  A => DISPLAY2 (0) , B => DISPLAY2 (1) , C => DISPLAY2 (2) , D => DISPLAY2 (3) , E => DISPLAY2 (4) , F => DISPLAY2 (5) , G => DISPLAY2 (6) );

DISPLAY2NEGATIVO <= (not DISPLAY1NEGATIVO);
APAGANDOLEDSAOREDORDONEGATIVO(0) <= '1';
APAGANDOLEDSAOREDORDONEGATIVO(1) <= '1';
APAGANDOLEDSAOREDORDONEGATIVO(2) <= '1';
APAGANDOLEDSAOREDORDONEGATIVO(3) <= '1';
APAGANDOLEDSAOREDORDONEGATIVO(4) <= '1';
APAGANDOLEDSAOREDORDONEGATIVO(5) <= '1';
end ckt;


