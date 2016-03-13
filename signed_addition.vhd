library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity signed_addition is
generic (N : integer := 4);
port (a_s : in signed (3 downto 0);
      b_s : in signed (3 downto 0);
      c_s : out signed (3 downto 0));

end entity signed_addition;

architecture beh_saddition of signed_addition is

signal temp_s: signed(4 downto 0);

component adder 
	port(ax,bx,cinx : in std_logic;
	     s1x,cout1x : out std_logic);
end component;


begin

	temp_s(0) <= '0';

	FA : for i in 0 to N-1 generate
		FA_i : adder port map(ax => a_s(i), bx => b_s(i), cinx => temp_s(i), s1x => c_s(i), cout1x => temp_s(i+1));
	end generate;

end architecture beh_saddition;

