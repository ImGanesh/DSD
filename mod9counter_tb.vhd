library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mod9counter_tb is
end entity;

architecture test_bench of mod9counter_tb is

component mod9counter 
	port(clk : in std_logic;
		op : out std_logic_vector(3 downto 0));
end component;

signal clk : std_logic;
signal op : std_logic_vector(3 downto 0);

constant cycle : time := 50 ns;

begin
	mapping : mod9counter port map(clk,op);
	
	--clock signal
	process
		begin
			clk <= '0';
			wait for cycle;
			clk <= '1';
			wait for cycle;
		end process;
	
end architecture;