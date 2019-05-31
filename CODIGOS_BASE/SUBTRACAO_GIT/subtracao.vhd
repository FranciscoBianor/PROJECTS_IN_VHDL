library ieee;
use ieee.std_logic_1164.all ;



entity subtracao is 
	port ( B_SUB , E_SUB , H_SUB , I_SUB ,CLK_SUB : in std_logic ;
			DISPLAY_NEGATIVO , DISPLAY_VALOR1 , DISPLAY_VALOR2 , DISPLAY_VALOR3  : out std_logic );
end subtracao;


architecture ckt of subtracao is 

	component comparador 
		port (A_COMP,B_COMP: in std_logic_vector (1 downto 0);
				A_COMP_menor_B_COMP , igual, A_COMP_maior_B_COMP : out std_logic);
	end component ;
	
	
	component ca2 
		port ( H_C2, I_C2  : in std_logic;
				SAIDA_H_C2 , SAIDA_I_C2 , COUT_SOMADOR_C2 : out std_logic);
	end component;
	
	
	component soma_2bits_com_c2 
		port ( B_SC2 , E_SC2 , HC2 , IC2 , Ci_C2 : in std_logic ;
				R1 , R2 , COUT_SOMADOR : out std_logic);
			
	end component;
	
	component FF_D 
		port (clk, cle, pre,entradad: in std_logic;
				q:out std_logic);
	end component;
	
	component ca2_3 
		port ( T6_C2 , T5_C2 , T4_C2 : in std_logic;
				SAIDA_RF1 , SAIDA_RF2 , SAIDA_RF3 : out std_logic);
	end component ;
	
	signal BE_MENOR_HI , BE_IGUAL_HI , BE_MAIOR_HI : std_logic ;
	signal POR : std_logic ;
	signal S_HC2 , S_IC2 , CO_C2: std_logic ;
	signal S_CSM , S_R1 , S_R2 : std_logic ;
	signal T1 , T2 , T3 , T4 ,  T5 , T6 : std_logic;
	signal RF1 , RF2 , RF3 : std_logic  ;
	
begin 

	comparando_BE_HI : comparador port map ( A_COMP(1) => B_SUB , A_COMP(0) => E_SUB , B_COMP(1) => H_SUB , B_COMP(0) => I_SUB , A_COMP_menor_B_COMP => BE_MENOR_HI , igual => BE_IGUAL_HI , A_COMP_maior_B_COMP => BE_MAIOR_HI);
	comp_a2_HI : ca2 port map ( H_C2 => H_SUB , I_C2 => I_SUB , SAIDA_H_C2 => S_HC2 , SAIDA_I_C2 => S_IC2 , COUT_SOMADOR_C2 => CO_C2 );
	soma_BE_C2 : soma_2bits_com_c2 port map ( B_SC2 => B_SUB , E_SC2 => E_SUB , HC2 => S_HC2 , IC2 => S_IC2 , Ci_C2 => CO_C2 , R1 => S_R1 , R2 => S_R2 , COUT_SOMADOR => S_CSM ); 
	
	POR <= ( BE_MAIOR_HI or BE_IGUAL_HI ) ; 
	
	FF_SAIDA_COUT_1: FF_D port map (  clk => CLK_SUB , cle => POR , pre => '1' ,  entradad => S_CSM , q => T1 );
	FF_S1_1: FF_D port map (  clk => CLK_SUB , cle => POR , pre => '1'  ,  entradad => S_R1 , q => T2 )  ;
	FF_S0_1: FF_D port map (  clk => CLK_SUB , cle=> POR , pre => '1'  ,  entradad => S_R2 , q => T3 ) ;
	
	FF_SAIDA_COUT_0: FF_D port map (  clk => CLK_SUB , cle => BE_MENOR_HI , pre => '1'  ,  entradad => S_CSM , q => T4 );
	FF_S1_0: FF_D port map (  clk => CLK_SUB , cle => BE_MENOR_HI , pre => '1'  ,  entradad => S_R1 , q => T5 )  ;
	FF_S0_0: FF_D port map (  clk => CLK_SUB , cle => BE_MENOR_HI , pre => '1'  ,  entradad => S_R2 , q => T6 ) ;
	
	comp_a2_FIM : ca2_3 port map ( T6_C2 => T6, T5_C2 => T5 , T4_C2 => T4 , SAIDA_RF1  => RF1 , SAIDA_RF2 =>  RF2 , SAIDA_RF3 => RF3 );
	
	DISPLAY_VALOR1 <= ( RF1 or T1 ) ;
	DISPLAY_VALOR2 <= ( RF2 or T2 ) ;
	DISPLAY_VALOR3 <= ( RF3 or T3 ) ;
	DISPLAY_NEGATIVO <= BE_MENOR_HI ;
	
end ckt;

