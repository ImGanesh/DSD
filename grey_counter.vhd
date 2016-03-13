library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity grey_counter is

port (clk : in std_logic;
	  rst : in std_logic;
	  o   : out std_logic_vector(3 downto 0));
	  
end entity grey_counter;

architecture greyCodeCounter of grey_counter is

signal temp : std_logic_vector(3 downto 0) := "0000";

begin

	process(clk,rst)
		begin
			if(clk'event and clk ='1') then
				if(rst ='1') then
					temp <= "0000";
					o <= temp;
				else
					temp <= std_logic_vector(unsigned(temp) + 1);
					o <= temp(3) & (temp(3) xor temp(2)) & (temp(2) xor temp(1)) & (temp(1) xor temp(0));
				end if;
			
			
			end if;
	end process;
	
end architecture greyCodeCounter;

