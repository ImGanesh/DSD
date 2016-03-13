library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.std_logic_unsigned.all;

entity johnsoncounter is

port (
		clk : in std_logic;
		clr : in std_logic;
		o	: out std_logic_vector(3 downto 0));
		
end entity johnsoncounter;

architecture johnsoncounter4bit of johnsoncounter is

signal temp : std_logic_vector(3 downto 0) := "0000";

	begin
		
	process(clk)
		begin
			if(clk'event and clk='1') then
				if(clr='1') then
					temp <= "0000";
				else
					temp<= not temp(0) & temp(3 downto 1);
				end if;
				o <= temp;
			end if;
		end process;
		
	end architecture johnsoncounter4bit;

	