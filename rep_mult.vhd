library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity multiplier is 

port (
	 rst	: in std_logic;
	 clk	: in std_logic;
	 start	: in std_logic;
	 a_in	: in std_logic_vector(7 downto 0);
	 b_in	: in std_logic_vector(7 downto 0);
	 r_out	: out std_logic_vector(15 downto 0);
	 r_valid: out std_logic;
	 ready	: out std_logic);
	 
end entity multiplier;

architecture rtl of multiplier is

type state_type is (idle, ab0, load, op);
signal current_s, next_s : state_type;
signal n,a: unsigned(7 downto 0);
signal r : unsigned(15 downto 0);

begin

process(clk,rst)
begin
	if(rst = '1') then
		current_s <= idle;
	elsif(rising_edge (clk)) then
		current_s <= next_s;
	end if;
end process;

process(current_s, start, a_in, b_in)
begin	
	case current_s is 
		when idle =>
		ready <= '1';
			if(start = '0') then 
				next_s <= idle;
			else
				if(a_in = "00000000" or b_in = "00000000") then
					next_s <= ab0;
				else
					next_s <= load;
				end if;
			end if;
		
		when ab0 => 
		n <= unsigned(b_in);
		a <= unsigned(a_in);
		r_out <= "0000000000000000";
		next_s <= idle;

		when load =>
		n <= unsigned(b_in);
		a <= unsigned(a_in);
		r <= "0000000000000000";
		next_s <= op;
		
		when op =>
		r <= r + resize(a,16);
		n <= n - 1;
		if(n = "00000001") 
			r <= r + a;
			r_out <= std_logic_vector(r);
			next_s <= idle;
		else
			next_s <= op;
		end if;
		
	end case;
end process;

end architecture rtl;
