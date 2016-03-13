-- universal shift register
--"00" -> shift right
--"01" -> shift left
--"10" -> parallel load

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity universal_shift_tb is
	   
end universal_shift_tb;

architecture universalShiftRegistertb of universal_shift_tb is

signal a_tb : std_logic_vector(3 downto 0) := "1010";
signal temp_tb : std_logic_vector(3 downto 0) := "0000";
signal clk_tb : std_logic;
signal rst_tb : std_logic;
signal sel_tb : std_logic_vector(1 downto 0);
signal output_tb : std_logic_vector(3 downto 0);
constant clk_period : time := 50ns;
constant rst_period_off : time := 150ns;
constant rst_period_on	: time := 50ns;


component universal_shift is
port ( a   : in std_logic_vector(3 downto 0) := "1010";
	   clk : in std_logic;
	   rst : in std_logic := '0';
	   sel : in std_logic_vector(1 downto 0) := "10";
	   o   : out std_logic_vector(3 downto 0));
	   
end component universal_shift;

begin

universal_tb : universal_shift port map (a => a_tb, clk => clk_tb, rst => rst_tb, sel => sel_tb, o => output_tb);
sel:	process
			begin
				wait for 100ns;
				sel_tb <= "10";
				wait for 100ns;
				sel_tb <= "00";
				wait for 100ns;
				sel_tb <= "01";
		end process;
		
clock: 	process
			begin
				clk_tb <= '1';
				wait for clk_period;
				clk_tb <= '0';
				wait for clk_period;
		end process;

reset:	process
			begin
				rst_tb <='0';
				wait for rst_period_off;
				rst_tb <='1';
				wait for rst_period_on;
		end process;
		
end architecture universalShiftRegistertb;
			
			