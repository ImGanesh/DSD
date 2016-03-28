library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity demoMathFunc is
port(
	clk_i, reset_i: in std_logic;
	a_i, b_i: in std_logic_vector(2 downto 0);
	y: out std_logic_vector(6 downto 0)
	);

end entity demoMathFunc;

Architecture rtl of demoMathFunc is

begin

process(clk_i, reset_i)

variable temp : integer;
variable temp1 : integer;
variable temp2 : integer;
variable temp3 : integer;

	begin
		--assuming asynchronous reset 
		if(reset_i='1') then
			temp := 0;
		elsif(reset_i='0') then
			if(clk_i'event and clk_i='1') then
				temp1 := to_integer(unsigned(a_i)) * to_integer(unsigned(a_i));
				temp2 := (to_integer(unsigned(b_i)) * to_integer(unsigned(b_i)));
				temp3 := (2 * to_integer(unsigned(a_i)) * to_integer(unsigned(b_i)));
				temp  := temp1 + temp2 + temp3;
			end if;
		else 
			temp := 0;
		end if;
		y <= std_logic_vector(to_unsigned(temp,7));
end process;



end architecture rtl;


			
