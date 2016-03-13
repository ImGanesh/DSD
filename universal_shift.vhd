-- universal shift register
--"00" -> shift right
--"01" -> shift left
--"10" -> parallel load

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity universal_shift is

port ( a   : in std_logic_vector(3 downto 0);
	   clk : in std_logic;
	   rst : in std_logic;
	   sel : in std_logic_vector(1 downto 0);
	   o   : out std_logic_vector(3 downto 0));
	   
end universal_shift;

architecture universalShiftRegister of universal_shift is

signal temp : std_logic_vector(3 downto 0) := "0000";

begin

	process(clk)
		begin
		
			if(clk'event and clk='1') then
				if(rst = '1') then
					temp <= "0000";
				
				else
				
					CASE sel is
						WHEN "00" => temp <= std_logic_vector(shift_right(unsigned(temp),1));
						WHEN "01" => temp <= std_logic_vector(shift_left(unsigned(temp),1));
						WHEN "10" => temp <= a;
						WHEN others => NULL;
					end CASE;
					
			
				end if;	
			end if;
			o <= temp;
	end process;

	
end architecture universalShiftRegister;

