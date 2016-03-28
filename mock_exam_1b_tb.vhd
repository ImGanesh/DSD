library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity demoMathFunc_testbench is


end entity demoMathFunc_testbench;

architecture test_bench of demoMathFunc_testbench is

signal a_s : std_logic_vector(2 downto 0) := "001";
signal b_s : std_logic_vector(2 downto 0) := "001";
signal reset_s : std_logic := '0';
signal temp_s : std_logic_vector(6 downto 0);

constant clk_period : time := 1 ns;
signal clk : std_logic := '0';

component demoMathFunc is
port(
	clk_i, reset_i: in std_logic;
	a_i, b_i: in std_logic_vector(2 downto 0);
	y: out std_logic_vector(6 downto 0)
	);

end component;

begin

instant : demoMathFunc port map (clk_i => clk, reset_i => reset_s,a_i => a_s, b_i => b_s,  y => temp_s);

process

	begin
		wait for 10 ns;
		a_s <= "100";
		wait for 10 ns;
		b_s <= "011";
		wait for 20 ns;
		reset_s <= '0';
		
end process;

clk_process : process
   begin
        clk <= '0';
        wait for clk_period/2;  --for 0.5 ns signal is '0'.
        clk <= '1';
        wait for clk_period/2;  --for next 0.5 ns signal is '1'.
end process;

end architecture test_bench;
