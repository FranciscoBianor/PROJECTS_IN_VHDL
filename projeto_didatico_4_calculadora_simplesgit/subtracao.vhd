library ieee;
use ieee.std_logic_1164.all ;



entity subtracao is 
	port ( BSUB , ESUB , HSUB , ISUB , CLKSUB : in std_logic ;
			DISPLAY_NEGATIVO , DISPLAY_VALOR1 , DISPLAY_VALOR2 , DISPLAY_VALOR3  : out std_logic );
end subtracao ;


architecture ckt of subtracao is 

	component comparador 
		port (A_COMP,B_COMP: in std_logic_vector (1 downto 0);
				A_COMP_menor_B_COMP , igual, A_COMP_maior_B_COMP : out std_logic);
	end component ;
	
	
	component CA2_2BITS 
		port ( H_C2, I_C2  : in std_logic;
				SAIDA_H_C2 , SAIDA_I_C2 , COUT_SOMADOR_C2 : out std_logic);
	end component;
	
	
	component SOMA_2BITS_COM_CA2_2BITS 
		port ( SOMA_B , SOMA_E , SOMA_HC2 , SOMA_IC2 , SOMA_CO_C2 : in std_logic ;
			R1 , R2 , R0: out std_logic);
			
	end component;
	
	component FF_D 
		port (clk, cle, pre, entradad : in std_logic;
				q:out std_logic);
	end component;
	
	component CA2_3BITS 
		port ( T6_C2 , T5_C2 , T4_C2 : in std_logic;
		 SAIDA_RF1 , SAIDA_RF2 , SAIDA_RF3 : out std_logic);
	end component ;
	
	signal BE_MENOR_HI , BE_IGUAL_HI , BE_MAIOR_HI : std_logic ;
	signal POR : std_logic ;
	signal S_HC2 , S_IC2 , CO_C2: std_logic ;
	signal S_R0 , S_R1 , S_R2 : std_logic ;
	signal T1 , T2 , T3 , T4 ,  T5 , T6 : std_logic;
	signal RF1 , RF2 , RF3 : std_logic  ;
	
begin 

	comparando_BE_HI : comparador port map ( A_COMP(1) => BSUB , A_COMP(0) => ESUB , B_COMP(1) => HSUB , B_COMP(0) => ISUB , A_COMP_menor_B_COMP => BE_MENOR_HI , igual => BE_IGUAL_HI , A_COMP_maior_B_COMP => BE_MAIOR_HI);
	comp_a2_HI : CA2_2BITS port map ( H_C2 => HSUB , I_C2 => ISUB , SAIDA_H_C2 => S_HC2 , SAIDA_I_C2 => S_IC2 , COUT_SOMADOR_C2 => CO_C2 );
	soma_BE_C2 : SOMA_2BITS_COM_CA2_2BITS port map ( SOMA_B => BSUB , SOMA_E => ESUB , SOMA_HC2 => S_HC2 , SOMA_IC2 => S_IC2 , SOMA_CO_C2 => CO_C2 , R1 => S_R1 , R2 => S_R2 , R0 => S_R0 ); 
	
	POR <= ( BE_MAIOR_HI or BE_IGUAL_HI ) ; 
	
	FF_SAIDA_COUT_1: FF_D port map (  clk => CLKSUB , cle => POR , pre => '1' ,  entradad => S_R0 , q => T1 );
	FF_S1_1: FF_D port map (  clk => CLKSUB , cle => POR , pre => '1'  ,  entradad => S_R1 , q => T2 )  ;
	FF_S0_1: FF_D port map (  clk => CLKSUB , cle=> POR , pre => '1'  ,  entradad => S_R2 , q => T3 ) ;
	
	FF_SAIDA_COUT_0: FF_D port map (  clk => CLKSUB , cle => BE_MENOR_HI , pre => '1'  ,  entradad => S_R0 , q => T4 );
	FF_S1_0: FF_D port map (  clk => CLKSUB , cle => BE_MENOR_HI , pre => '1'  ,  entradad => S_R1 , q => T5 )  ;
	FF_S0_0: FF_D port map (  clk => CLKSUB , cle => BE_MENOR_HI , pre => '1'  ,  entradad => S_R2 , q => T6 ) ;
	
	comp_a2_FIM : CA2_3BITS port map ( T6_C2 => T6, T5_C2 => T5 , T4_C2 => T4 , SAIDA_RF1  => RF1 , SAIDA_RF2 =>  RF2 , SAIDA_RF3 => RF3 );
	
	DISPLAY_VALOR1 <= ( RF1 or T1 ) ;
	DISPLAY_VALOR2 <= ( RF2 or T2 ) ;
	DISPLAY_VALOR3 <= ( RF3 or T3 ) ;
	DISPLAY_NEGATIVO <= BE_MENOR_HI ;
	
end ckt ;

