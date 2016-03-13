library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.std_logic_unsigned.all;

entity mod9counter is

port(clk : in std_logic;
	 clr : in std_logic;
	 output : out std_logic_vector(3 downto 0));
	 
end entity mod9counter;

architecture mod9counter_behaviour of mod9counter is

signal temp : std_logic_vector(3 downto 0) := "0000";

begin

	process(clk)
		begin
		if(clr = '1') then
			temp<= "0000";
		elsif (clk'event and clk ='1') then
				if (temp = "1000") then
					temp <= "0000";
				else
					temp <= temp + 1;
				end if;
		end if;
		
	end process;
output <= temp;
end architecture mod9counter_behaviour;
					