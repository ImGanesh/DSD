library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.std_logic_unsigned.all;

entity counter is

port (clk, clr : in std_logic;
      o : out std_logic_vector(3 downto 0));

end entity counter;

architecture fourbitcounter of counter is

signal temp : std_logic_vector(3 downto 0) := "0000";

begin


	process(clk,temp,clr)
	begin
		
		if (clk'event and clk = '1') then
			if(clr = '1') then 
				temp <= "0000";
		else 
				temp <= temp + 1;
		end if;
	end if;
		
	end process;
o <= temp;
end architecture fourbitcounter;
