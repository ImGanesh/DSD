library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;


entity subtractor is

port (  ax : in std_logic;
	bx : in std_logic;
	s1x : out std_logic;
	cout1x : out std_logic);

end entity subtractor;
	
architecture behav_sub of subtractor is 

signal d : std_logic;
signal tempfa: std_logic;
	
begin 

	process(ax,bx,tempfa,d)
		begin
			d <= not bx;
			tempfa <= ax xor d;
			s1x <= not tempfa;
			cout1x <= (ax and d) or tempfa;
	end process;
	
end architecture behav_sub;
