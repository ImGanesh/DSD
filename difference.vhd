library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity unsigned_subtraction is
generic (N : integer := 4);
port (a_us : in unsigned (3 downto 0);
      b_us : in unsigned (3 downto 0);
      c_us : out unsigned (3 downto 0));

end entity unsigned_subtraction;

architecture beh_unsubtraction of unsigned_subtraction is

signal temp_us: unsigned(4 downto 0);

component subtractor 
	port(ax,bx : in std_logic;
	     s1x,cout1x : out std_logic);
end component;


begin

	temp_us(0) <= '1';

	FA : for i in 0 to N-1 generate
		FA_i : subtractor port map(ax => a_us(i), bx => b_us(i), s1x => c_us(i), cout1x => temp_us(i+1));
	end generate;

end architecture beh_unsubtraction;

