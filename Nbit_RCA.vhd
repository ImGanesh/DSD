library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity Nbit_RCA is

generic (N : integer := 2);
port(a : in std_logic_vector(N-1 downto 0);
     b : in std_logic_vector(N-1 downto 0);
     cin : in std_logic;
     s : out std_logic_vector(N-1 downto 0);
     cout : out std_logic);

end entity Nbit_RCA;


architecture RCA_adder of Nbit_RCA is

component adder 
	port(ax,bx,cinx : in std_logic;
	     s1x,cout1x : out std_logic);
end component;

signal temp : std_logic_vector(N downto 0);


begin

	temp(0) <= cin;

	FA : for i in 0 to N-1 generate
		FA_i : adder port map(ax => a(i), bx => b(i), cinx => temp(i), s1x => s(i), cout1x => temp(i+1));
	end generate;

	cout <= temp(N);

end architecture RCA_adder;

