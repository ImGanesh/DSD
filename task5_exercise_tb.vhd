library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity task5_tb is



end entity task5_tb;

architecture mux_tb of task5_tb is

component task5 is

port	(a_un : in unsigned(3 downto 0);
		 b_un : in unsigned(3 downto 0);
		 a_s	: in signed(3 downto 0);
	     b_s	: in signed(3 downto 0);
         sel : in std_logic_vector(1 downto 0);
         c : out std_logic_vector(3 downto 0));

end component task5;

signal s_un1 : unsigned(3 downto 0) := "1000";
signal s_un2 : unsigned(3 downto 0) := "0001";
signal s_s1	 : signed(3 downto 0) 	:= "0100";
signal s_s2	 : signed(3 downto 0)	:= "0101";
signal s_sel 		: std_logic_vector(1 downto 0) :="00";
signal s_c			: std_logic_vector(3 downto 0);

begin

	t5 : task5 port map (a_un => s_un1, b_un => s_un2, a_s => s_s1, b_s => s_s2, sel => s_sel, c => s_c);
	process
	begin
		wait for 100ns;
		s_sel <= "01";
		wait for 100ns;
		s_sel <= "10";
		wait for 100ns;
		s_sel <= "11";
	end process;

end architecture mux_tb;
	

	
	
