library ieee;
use ieee.std_logic_1164.all;

entity selecao_entradaa is 

	port (VAL_B1 , VAL_B2 , VAL_B3 , VAL_B4 , LOAD , BUT_LOAD_SOMA , BUT_LOAD_SUBTRARIR , BUT_LOAD_COMPARAR , GND , CLK_SELECAO : in std_logic ;
			A_LOAD , D_LOAD , G_LOAD , J_LOAD , B_LOAD  , E_LOAD , H_LOAD , K_LOAD , C_LOAD  ,F_LOAD , I_LOAD , L_LOAD : out std_logic);
			
end selecao_entradaa;


architecture ckt of selecao_entradaa is


 component projetoflipflopd 

	port (clk, clear, preset,entradad: in std_logic;
			q:out std_logic);
			
 end component;

  signal saida_porta_ou_but1 ,  saida_porta_ou_but2 , saida_porta_ou_but3 , saida_porta_ou_but4 : std_logic ;
  signal saida_flipflop_carrega_but1 ,  saida_flipflop_carrega_but2 , saida_flipflop_carrega_but3 , saida_flipflop_carrega_but4 : std_logic ;

begin 


	 saida_porta_ou_but1 <= ( VAL_B1 or GND);
	 saida_porta_ou_but2 <= ( VAL_B2 or GND);
	 saida_porta_ou_but3 <= ( VAL_B3 or GND);
	 saida_porta_ou_but4 <= ( VAL_B4 or GND);
	 
	 FFD_L1 : projetoflipflopd port map ( clk => CLK_SELECAO , clear => LOAD , preset => '1' , entradad => saida_porta_ou_but1 , q => saida_flipflop_carrega_but1 );
	 FFD_L2 : projetoflipflopd port map ( clk => CLK_SELECAO , clear => LOAD , preset => '1' , entradad => saida_porta_ou_but2 , q => saida_flipflop_carrega_but2 );
	 FFD_L3 : projetoflipflopd port map ( clk => CLK_SELECAO , clear => LOAD , preset => '1' , entradad => saida_porta_ou_but3 , q => saida_flipflop_carrega_but3 );
	 FFD_L4 : projetoflipflopd port map ( clk => CLK_SELECAO , clear => LOAD , preset => '1' , entradad => saida_porta_ou_but4 , q => saida_flipflop_carrega_but4 );

	 FFD_A : projetoflipflopd port map ( clk => CLK_SELECAO , clear => BUT_LOAD_SOMA , preset => '1' , entradad => saida_flipflop_carrega_but1 , q =>  A_LOAD );
	 FFD_B : projetoflipflopd port map ( clk => CLK_SELECAO , clear => BUT_LOAD_SUBTRARIR , preset => '1' , entradad => saida_flipflop_carrega_but1 , q =>  B_LOAD);
	 FFD_C : projetoflipflopd port map ( clk => CLK_SELECAO , clear => BUT_LOAD_COMPARAR , preset => '1' , entradad => saida_flipflop_carrega_but1 , q =>  C_LOAD);
	 FFD_D : projetoflipflopd port map ( clk => CLK_SELECAO , clear => BUT_LOAD_SOMA , preset => '1' , entradad => saida_flipflop_carrega_but2 , q =>  D_LOAD);
	 FFD_E : projetoflipflopd port map ( clk => CLK_SELECAO , clear => BUT_LOAD_SUBTRARIR , preset => '1' , entradad => saida_flipflop_carrega_but2 , q =>  E_LOAD);
	 FFD_F : projetoflipflopd port map ( clk => CLK_SELECAO , clear => BUT_LOAD_COMPARAR , preset => '1' , entradad => saida_flipflop_carrega_but2 , q =>  F_LOAD);
	 FFD_G : projetoflipflopd port map ( clk => CLK_SELECAO , clear => BUT_LOAD_SOMA , preset => '1' , entradad => saida_flipflop_carrega_but3 , q =>  G_LOAD);
	 FFD_H : projetoflipflopd port map ( clk => CLK_SELECAO , clear => BUT_LOAD_SUBTRARIR , preset => '1' , entradad => saida_flipflop_carrega_but3 , q =>  H_LOAD);
	 FFD_I : projetoflipflopd port map ( clk => CLK_SELECAO , clear => BUT_LOAD_COMPARAR , preset => '1' , entradad => saida_flipflop_carrega_but3 , q =>  I_LOAD);
	 FFD_J : projetoflipflopd port map ( clk => CLK_SELECAO , clear => BUT_LOAD_SOMA , preset => '1' , entradad => saida_flipflop_carrega_but4 , q =>  J_LOAD);
	 FFD_K : projetoflipflopd port map ( clk => CLK_SELECAO , clear => BUT_LOAD_SUBTRARIR , preset => '1' , entradad => saida_flipflop_carrega_but4 , q =>  K_LOAD);
	 FFD_L : projetoflipflopd port map ( clk => CLK_SELECAO , clear => BUT_LOAD_COMPARAR , preset => '1' , entradad => saida_flipflop_carrega_but4 , q =>  L_LOAD);
	 

end ckt;

