library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux_ops is
	port(in0,in1 : in std_logic_vector(3 downto 0);
		sel : in std_logic_vector(1 downto 0);
		op : out std_logic_vector(3 downto 0));
end entity;

architecture operations of mux_ops is

signal si0,si1 : signed(3 downto 0);
signal ui0,ui1 : unsigned(3 downto 0);
signal n : integer;

begin 
	process(in0,in1,sel)
		begin
			-- unsigned nos
			ui0 <= unsigned(in0);
			ui1 <= unsigned(in1);
			-- signed nos
			si0 <= signed(si0);
			si1 <= signed(si1);
			
			case sel is
				-- unsigned addition
				when "00" =>	
					op <= std_logic_vector(ui0 + ui1);
				-- signed addition
				when "01" =>					
					op <= std_logic_vector(si0 + si1);
				-- unsigned differnce
				when "10" =>
					op <= std_logic_vector(ui0 - ui1);
				-- shift
				when "11" =>
					n <= abs(to_integer(si1));
					if(in1(3) = '1') then 
						op <= std_logic_vector(shift_right(ui0,n));					
					else
						op <= std_logic_vector(shift_left(ui0,n));
					end if;
				when others => null;
			end case;
		end process;
end architecture;