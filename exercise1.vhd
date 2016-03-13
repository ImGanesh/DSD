library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity adder is

port (  a : in std_logic;
	b : in std_logic;
	cin : in std_logic;
	s1 : out std_logic;
	cout1 : out std_logic);

end entity adder;
	

architecture full_adder of adder is 
	
signal tempfa: std_logic;
	
begin 
	

	
	process(a,b,cin)

		begin
			tempfa <= a xor b;
			s1 <= tempfa xor cin;
			cout1 <= (a and b) or (tempfa and cin);
	end process;
	
end architecture full_adder;


