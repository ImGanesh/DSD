library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity unsigned_addition is
generic (N : integer := 4);
port (a_un : in unsigned (3 downto 0);
      b_un : in unsigned (3 downto 0);
      sel_un : in std_logic_vector(1 downto 0);
      c_un : out unsigned (3 downto 0));

end entity unsigned_addition;

architecture beh_unaddition of unsigned_addition is

signal temp_un: unsigned(4 downto 0);

component adder 
	port(ax,bx,cinx : in std_logic;
	     s1x,cout1x : out std_logic);
end component;


begin

	temp_un(0) <= '0';

	FA : for i in 0 to N-1 generate
		FA_i : adder port map(ax => a_un(i), bx => b_un(i), cinx => temp_un(i), s1x => c_un(i), cout1x => temp_un(i+1));
	end generate; 
	

end architecture beh_unaddition;


