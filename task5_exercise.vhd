library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity task5 is

port ( a_un : in unsigned(3 downto 0);
       b_un : in unsigned(3 downto 0);
	   a_s	: in signed(3 downto 0);
	   b_s	: in signed(3 downto 0);
       sel : in std_logic_vector(1 downto 0);
       c : out std_logic_vector(3 downto 0));

end entity task5;

architecture mux of task5 is


begin

	process(a_s,a_un,b_s,b_un,sel)
		begin
			CASE sel is	
				WHEN "00" => c <= std_logic_vector(a_un + b_un);  -- unsigned addition
				WHEN "01" => c <= std_logic_vector(a_s + b_s);	  -- signed addition
				WHEN "10" => c <= std_logic_vector(a_un - b_un);  -- unsigned subtraction
				WHEN "11" => 
							if(b_s(3) = '1' ) then														-- if b is negative, shift right
								c <= std_logic_vector(shift_right(a_s,abs(to_integer(b_s))));			-- shift_right and shift_left works only with signed/unsigned vectors and natural value.
							else
								c <= std_logic_vector(shift_left(a_s,abs(to_integer(b_s))));			-- if b is positive, shift left
							end if;
				WHEN others => NULL;																	-- total of 81 cases possible wrt std_logic_vector.
				
			end CASE;
		end process;
		
end architecture mux;
